import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

void main() {
  runApp(VideoDownloaderApp());
}

class VideoDownloaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Downloader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}