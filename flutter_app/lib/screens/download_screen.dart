import 'package:flutter/material.dart';
import 'package:flutter_app/services/video_downloader.dart';
import 'package:flutter_app/widgets/download_button.dart';
import 'package:flutter_app/widgets/video_card.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/helpers.dart';

class DownloadScreen extends StatefulWidget {
  @override
  _DownloadScreenState createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final _urlController = TextEditingController();
  Video _video;
  String _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Video'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter video URL',
                errorText: _errorMessage,
              ),
            ),
            SizedBox(height: 10),
            _video != null ? VideoCard(_video) : Container(),
            SizedBox(height: 10),
            DownloadButton(
              onPressed: _video != null ? () => downloadVideo(_video) : null,
            ),
          ],
        ),
      ),
    );
  }

  void downloadVideo(Video video) async {
    try {
      final path = await getDownloadPath();
      await VideoDownloader().download(video, path);
      showSuccessMessage(context, 'Download successful');
    } catch (e) {
      showErrorMessage(context, 'Download failed');
    }
  }

  void parseUrl(String url) async {
    try {
      final video = await UrlParser().parse(url);
      setState(() {
        _video = video;
        _errorMessage = null;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Invalid URL';
      });
    }
  }
}