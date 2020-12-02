import 'dart:io';

import 'package:flutter/material.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/utility/generate_report/generate_report.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class GeneratedPDFScreen extends StatelessWidget {
  const GeneratedPDFScreen({Key key, this.inspectionData}) : super(key: key);

  final InspectionData inspectionData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.picture_as_pdf),
            onPressed: () async {
              final directory = await getExternalStorageDirectory();
              final file = File(
                  "${directory.path}/${inspectionData.name}-${inspectionData.address}.pdf");
              await file
                  .writeAsBytes(await generateReport(inspectionData))
                  .then((value) => {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('PDF was created successfully')))
                      });
            },
          );
        },
      ),
      body: PdfPreview(
        allowPrinting: false,
        allowSharing: false,
        initialPageFormat: PdfPageFormat.a4,
        useActions: false,
        build: (format) async {
          return await generateReport(inspectionData);
        },
      ),
    );
  }
}
