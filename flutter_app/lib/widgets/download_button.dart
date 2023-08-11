import 'package:flutter/material.dart';
import 'package:flutter_app/services/video_downloader.dart';

class DownloadButton extends StatelessWidget {
  final String videoUrl;

  DownloadButton({@required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        try {
          await VideoDownloader.downloadVideo(videoUrl);
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Download started!')),
          );
        } catch (e) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text('Download failed!')),
          );
        }
      },
      child: Text('Download'),
    );
  }
}