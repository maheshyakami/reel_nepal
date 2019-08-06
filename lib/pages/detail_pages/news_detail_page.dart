import 'package:flutter/material.dart';
import 'package:reel_nepal/services/news_service.dart';

import '../../singletons.dart';
import '../search_page.dart';

class NewsDetailPage extends StatefulWidget {
  final int newsId;
  final String title;

  const NewsDetailPage({Key key, this.newsId, this.title}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        title: Text("${widget.title}"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              })
        ],
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder(
          future: singletons<NewsService>().getNewsById(widget.newsId),
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {}
            }
            return Container();
          }),
    );
  }
}
