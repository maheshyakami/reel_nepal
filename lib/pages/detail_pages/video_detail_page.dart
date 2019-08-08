import 'package:flutter/material.dart';
import 'package:reel_nepal/widgets/reel_appbar.dart';
import 'package:time_ago_provider/time_ago_provider.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            YoutubePlayer(
              context: context,
              videoId: widget.youTubeId,
              flags: YoutubePlayerFlags(
                //hideFullScreenButton: true,
                showVideoProgressIndicator: true,
                autoPlay: false,
                hideControls: false,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //var timeStamp = DateTime.parse(data[index].publishedDate).millisecondsSinceEpoch;
            //String timeAgo = TimeAgo.getTimeAgo(timeStamp);
            Text(
                "Published ${TimeAgo.getTimeAgo(DateTime.parse(widget.publishedDate).millisecondsSinceEpoch)}"),
            Text("Description: " + widget.description),
          ],
        ),
      ),
    );
  }
}
