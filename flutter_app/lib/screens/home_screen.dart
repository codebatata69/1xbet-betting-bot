import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/video_card.dart';
import 'package:flutter_app/widgets/download_button.dart';
import 'package:flutter_app/services/video_downloader.dart';
import 'package:flutter_app/utils/constants.dart';
import 'package:flutter_app/utils/helpers.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _urlController = TextEditingController();
  Video _video;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Downloader'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter video URL',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: _isLoading ? null : _fetchVideo,
              child: _isLoading ? CircularProgressIndicator() : Text('Fetch Video'),
            ),
            SizedBox(height: 10),
            _video != null ? VideoCard(video: _video) : Container(),
            SizedBox(height: 10),
            _video != null ? DownloadButton(video: _video) : Container(),
          ],
        ),
      ),
    );
  }

  void _fetchVideo() async {
    setState(() {
      _isLoading = true;
    });

    final url = _urlController.text;
    if (!isValidUrl(url)) {
      showMessage(context, 'Invalid URL');
      return;
    }

    final video = await VideoDownloader.fetchVideo(url);
    if (video == null) {
      showMessage(context, 'Failed to fetch video');
      return;
    }

    setState(() {
      _video = video;
      _isLoading = false;
    });
  }
}