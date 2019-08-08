import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/crew_model.dart';
import 'package:reel_nepal/services/crew_service.dart';

import '../../singletons.dart';
import '../search_page.dart';
import 'movie_detail_page.dart';

class CrewDetailPage extends StatefulWidget {
  final int crewId;
  final String title;

  CrewDetailPage({this.crewId, this.title});

  @override
  _CrewDetailPageState createState() => _CrewDetailPageState();
}

class _CrewDetailPageState extends State<CrewDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withBlue(201).withOpacity(0.15),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('${widget.title}'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              })
        ],
      ),
      body: FutureBuilder<CrewModel>(
        future: singletons<CrewService>().getCrewById(widget.crewId),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Text(
                    snapshot.data.name,
                    style: TextStyle(fontSize: 24),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 317,
                        width: 214,
                        child: CachedNetworkImage(
                          imageUrl: AppConfiguration.crewImgThumbnail(
                              snapshot.data.profilePhoto),
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.face),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                snapshot.data.nameNepali ?? snapshot.data.name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "DoB: ${snapshot.data.dob}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Designation: ${snapshot.data.designation}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // ignore: sdk_version_ui_as_code
                  if (snapshot.data.hasBiography)
                    Row(
                      children: <Widget>[
                        Text(
                          "Biography",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  // ignore: sdk_version_ui_as_code
                  if (snapshot.data.hasBiography)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Html(
                          defaultTextStyle: TextStyle(color: Colors.white),
                          data: """${snapshot.data.fullBio}""",
                          useRichText: true,
                        ),
                      ),
                    ),
                  // ignore: sdk_version_ui_as_code
                  if (snapshot.data.hasBiography)
                    SizedBox(
                      height: 15,
                    ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Filmography",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          snapshot.data.filmography[index].nameNepali ??
                              snapshot.data.filmography[index].name,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        leading: CachedNetworkImage(
                          imageUrl: AppConfiguration.movieImgThumbnail(
                              snapshot.data.filmography[index].coverPhoto),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(
                                        title: snapshot
                                            .data.filmography[index].name,
                                        movieId: snapshot
                                            .data.filmography[index].movieId,
                                      )));
                        },
                      ),
                      itemCount: snapshot.data.filmography.length,
                    ),
                  ),
                ],
              );
              ;
            }
          }
          return Container();
        },
      ),
    );
  }
}
