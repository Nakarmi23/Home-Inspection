import 'package:flutter/material.dart';
import 'package:house_review/models/inspection_data.dart';
import 'package:house_review/utility/generate_report/generate_report.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class GeneratedPDFScreen extends StatelessWidget {
  const GeneratedPDFScreen({Key key, this.inspectionData}) : super(key: key);

  final InspectionData inspectionData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pdf Preview'),
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
