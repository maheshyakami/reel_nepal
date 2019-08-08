import 'package:flutter/material.dart';
import 'package:reel_nepal/widgets/reel_appbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../search_page.dart';

class VideoDetailPage extends StatefulWidget {
  final int videoId;
  final String title;
  final String youTubeId;
  final String publishedDate;
  final String description;

  const VideoDetailPage(
      {Key key,
      this.videoId,
      this.title,
      this.youTubeId,
      this.publishedDate,
      this.description})
      : super(key: key);
  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReelAppBar(
        title: Text("${widget.title}"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          YoutubePlayer(
            context: context,
            videoId: widget.youTubeId,
            flags: YoutubePlayerFlags(
              showVideoProgressIndicator: true,
              autoPlay: false,
              hideControls: false,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.publishedDate),
          Text(widget.description),
        ],
      ),
    );
  }
}
