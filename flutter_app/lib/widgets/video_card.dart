import 'package:flutter/material.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/widgets/download_button.dart';

class VideoCard extends StatelessWidget {
  final String videoUrl;
  final String thumbnailUrl;
  final String title;

  VideoCard({this.videoUrl, this.thumbnailUrl, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.network(
            thumbnailUrl,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(videoUrl),
            trailing: DownloadButton(videoUrl: videoUrl),
          ),
        ],
      ),
    );
  }
}