import 'dart:convert';
import 'dart:io';

import 'package:house_review/models/inspection_data.dart';
import 'package:path_provider/path_provider.dart';

class InspectionFileRepository {
  Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory.path;
  }

  Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<File> writeFile(InspectionData inspectionData) async {
    final file = await _localFile(
        '${inspectionData.name}${DateTime.now().toIso8601String()}');

    // Write the file.
    return file.writeAsBytes(
      utf8.encode(
        json.encode(
          inspectionData.toJson(),
        ),
      ),
    );
  }

  Future<File> editFile(String filename, InspectionData inspectionData) async {
    final file = await _localFile('$filename');

    // Write the file.
    return file.writeAsBytes(
      utf8.encode(
        json.encode(
          inspectionData.toJson(),
        ),
      ),
    );
  }

  Future<InspectionData> readFile(String filename) async {
    try {
      final file = await _localFile(filename);

      // Read the file.
      List<int> byteContent = await file.readAsBytes();

      return InspectionData.fromJson(json.decode(utf8.decode(byteContent)));
    } catch (err) {
      throw err;
    }
  }

  Future<File> getFile(String filename) async {
    try {
      final file = await _localFile(filename);
      return file;
    } catch (err) {
      throw err;
    }
  }
}
