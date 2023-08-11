import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/utils/constants.dart';

class VideoDownloader {
  Dio _dio;

  VideoDownloader() {
    _dio = Dio();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _localFile(String filename) async {
    final path = await _localPath;
    return File('$path/$filename');
  }

  Future<void> downloadVideo(String url, String filename) async {
    try {
      final response = await _dio.download(url, '${DOWNLOAD_PATH}/$filename');
      if (response.statusCode == 200) {
        final file = await _localFile(filename);
        return file.writeAsBytes(response.data);
      } else {
        throw Exception('Failed to download video');
      }
    } catch (e) {
      throw Exception('Failed to download video: $e');
    }
  }
}