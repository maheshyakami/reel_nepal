import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/news_model.dart';
import 'package:reel_nepal/pages/detail_pages/news_detail_page.dart';
import 'package:reel_nepal/widgets/reel_appbar.dart';

import '../search_page.dart';

class TopNewsPage extends StatelessWidget {
  final List<NewsModel> data;

  const TopNewsPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReelAppBar(
        title: Text("Top News", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        mini: true,
        child: Icon(Icons.vertical_align_top),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(data[index].title),
            trailing: Text(data[index].publishedDate),
            enabled: true,
            subtitle: Text(data[index].refinedContent),
            leading: CachedNetworkImage(
              imageUrl:
                  AppConfiguration.API_NEWSBASE_URL + data[index].photoName,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetailPage(
                            newsId: data[index].newsId,
                          )));
            },
          ),
        ),
      ),
    );
  }
}
