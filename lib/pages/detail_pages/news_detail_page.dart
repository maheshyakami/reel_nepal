import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/news_model.dart';
import 'package:reel_nepal/services/news_service.dart';
import 'package:reel_nepal/widgets/reel_appbar.dart';
import 'package:time_ago_provider/time_ago_provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../singletons.dart';
import '../search_page.dart';
import 'movie_detail_page.dart';

class NewsDetailPage extends StatefulWidget {
  final int newsId;

  const NewsDetailPage({Key key, this.newsId}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReelAppBar(
        title: Text("News Detail"),
        //centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              })
        ],
      ),
      body: FutureBuilder<NewsModel>(
          future: singletons<NewsService>().getNewsById(widget.newsId),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                var timeStamp = DateTime.parse(snapshot.data.publishedDate)
                    .millisecondsSinceEpoch;
                String timeAgo = TimeAgo.getTimeAgo(timeStamp);
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 317,
                          width: 214,
                          child: CachedNetworkImage(
                            imageUrl: AppConfiguration.API_NEWSBASE_URL +
                                snapshot.data.photoName,
                            fit: BoxFit.fill,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.data.title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Posted: $timeAgo")),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Html(
                      defaultTextStyle: TextStyle(color: Colors.black),
                      data: """${snapshot.data.fullContent}""" ?? 'N/A',
                      useRichText: true,
                      onLinkTap: (url) async {
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Related Movies",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data.movieTags.length,
                            itemBuilder: (context, index) => ListTile(
                                  title:
                                      Text(snapshot.data.movieTags[index].name),
                                  leading: CachedNetworkImage(
                                    imageUrl:
                                        AppConfiguration.movieImgThumbnail(
                                            snapshot.data.movieTags[index]
                                                .coverPhoto),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailPage(
                                                  title: snapshot.data
                                                      .movieTags[index].name,
                                                  movieId: snapshot.data
                                                      .movieTags[index].movieId,
                                                )));
                                  },
                                ))),
                  ],
                );
              }
            }
            return Container();
          }),
    );
  }
}
