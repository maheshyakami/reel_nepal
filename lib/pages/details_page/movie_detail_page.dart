import 'package:cached_network_image/cached_network_image.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/movie_model.dart';
import 'package:reel_nepal/services/movie_service.dart';

import '../../singletons.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  final String title;

  MovieDetailPage({this.movieId, this.title});

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withBlue(201).withOpacity(0.15),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("${widget.title}"),
      ),
      body: FutureBuilder<MovieModel>(
        future: singletons<MovieService>().getMovieById(widget.movieId),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              print(widget.movieId);
              final dur = Duration(minutes: snapshot.data.runTime);
              return Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      snapshot.data.name,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        snapshot.data.releaseDate,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(snapshot.data.censorCertificate,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      SizedBox(
                        width: 15,
                      ),
                      Text(printDuration(dur),
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      SizedBox(
                        width: 15,
                      ),
                      Text(snapshot.data.genres.first.genreName ?? 'N/A',
                          style: TextStyle(color: Colors.white, fontSize: 14))
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 317,
                        width: 214,
                        child: CachedNetworkImage(
                          imageUrl: AppConfiguration.movieImgThumbnail(
                              snapshot.data.coverPhoto),
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: <Widget>[
                              Text(
                                ("Synopsis: ${snapshot.data.synopsis}") ??
                                    'N/A',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                ("Director: ${snapshot.data.directors.first.crewName}") ??
                                    'N/A',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Release Date: ${snapshot.data.releaseDate}",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              );
            }
          }
          return Container(
            child: Text(snapshot.data.toString()),
          );
        },
      ),
    );
  }
}
