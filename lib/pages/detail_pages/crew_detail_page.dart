import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/crew_model.dart';
import 'package:reel_nepal/services/crew_service.dart';

import '../../singletons.dart';

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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        title: Text('${widget.title}'),
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
              return SingleChildScrollView(
                child: Column(
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
                                  snapshot.data.nameNepali,
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
                    Html(
                      defaultTextStyle: TextStyle(color: Colors.white),
                      data: """${snapshot.data.fullBio}""" ?? 'N/A',
                      useRichText: true,
                    ),
                  ],
                ),
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
