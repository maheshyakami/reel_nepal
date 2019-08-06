import 'package:cached_network_image/cached_network_image.dart';
import 'package:duration/duration.dart';
import 'package:flutter/material.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/movie_model.dart';
import 'package:reel_nepal/services/movie_service.dart';

import '../../singletons.dart';
import 'crew_detail_page.dart';

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
                      if (snapshot.data.genres.isNotEmpty)
                        Text(snapshot.data.genres.first.genreName,
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
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
                              GestureDetector(
                                child: SizedBox(
                                  width: 150,
                                  child: Text(
                                    ("Director: ${snapshot.data.directors.first.crewName}") ??
                                        'N/A',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CrewDetailPage(
                                                title: snapshot.data.directors
                                                    .first.crewName,
                                                crewId: snapshot.data.directors
                                                    .first.crewId,
                                              )));
                                },
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Main Casts",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                "All Casts",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        "${snapshot.data.casts[index].crewName}",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      subtitle: Text(
                        "${snapshot.data.casts[index].roleName}",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      leading: CachedNetworkImage(
                        imageUrl: AppConfiguration.crewImgThumbnail(
                            snapshot.data.casts[index].profilePhoto),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CrewDetailPage(
                                      title:
                                          snapshot.data.casts[index].crewName,
                                      crewId: snapshot.data.casts[index].crewId,
                                    )));
                      },
                    ),
                    itemCount: snapshot.data.mainCasts.length,
                  ))
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
