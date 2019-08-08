import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/video_model.dart';
import 'package:reel_nepal/pages/detail_pages/video_detail_page.dart';
import 'package:reel_nepal/widgets/reel_appbar.dart';

import '../search_page.dart';

class RecentVideoPage extends StatelessWidget {
  final List<VideoModel> data;

  const RecentVideoPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        mini: true,
        child: Icon(Icons.vertical_align_top),
      ),
      appBar: ReelAppBar(
        title: Text("Recent Videos", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              })
        ],
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(data[index].title),
            //trailing: Text(data[index].publishedDate),
            subtitle: Text(data[index].description ?? 'N/A'),
            leading: CachedNetworkImage(
              imageUrl:
                  AppConfiguration.videoToThumbnail(data[index].youTubeId),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VideoDetailPage(
                            videoId: data[index].videoId,
                            title: data[index].title,
                            publishedDate: data[index].publishedDate,
                            youTubeId: data[index].youTubeId,
                            description: data[index].description ?? 'n/a',
                          )));
            },
          ),
        ),
        itemCount: data.length,
      ),
    );
  }
}
