import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/movie_model.dart';
import 'package:reel_nepal/pages/detail_pages/movie_detail_page.dart';
import 'package:reel_nepal/widgets/reel_appbar.dart';

import '../search_page.dart';

class FeaturedMoviesPage extends StatefulWidget {
  final List<MovieModel> data;

  const FeaturedMoviesPage({Key key, this.data}) : super(key: key);

  @override
  _FeaturedMoviesPageState createState() => _FeaturedMoviesPageState();
}

class _FeaturedMoviesPageState extends State<FeaturedMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReelAppBar(
        title: Text("Featured Movies", style: TextStyle(color: Colors.white)),
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
        itemCount: widget.data.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(widget.data[index].name),
            //trailing: Text(widget.data[index].releaseDate),

            //subtitle: Text(widget.data[index].genres.first.toString()),
            leading: CachedNetworkImage(
              imageUrl: AppConfiguration.API_MOVIEBASE_URL +
                  widget.data[index].coverPhoto,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                            title: widget.data[index].name,
                            movieId: widget.data[index].movieId,
                          )));
            },
          ),
        ),
      ),
    );
  }
}
