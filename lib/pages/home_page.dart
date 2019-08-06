import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reel_nepal/configurations/app_configuration.dart';
import 'package:reel_nepal/models/front/front_data_model.dart';
import 'package:reel_nepal/models/front/movie_model.dart';
import 'package:reel_nepal/models/front/news_model.dart';
import 'package:reel_nepal/models/front/video_model.dart';
import 'package:reel_nepal/pages/detail_pages/movie_detail_page.dart';
import 'package:reel_nepal/pages/info_pages/featured_movies_page.dart';
import 'package:reel_nepal/pages/info_pages/recent_videos_page.dart';
import 'package:reel_nepal/pages/info_pages/top_news_page.dart';
import 'package:reel_nepal/pages/search_page.dart';
import 'package:reel_nepal/services/front_data_service.dart';
import 'package:reel_nepal/widgets/reel_appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: defaultTargetPlatform == TargetPlatform.android
          ? () {
              return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(" Confirm Exit?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text("Yes")),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text("No"),
                        )
                      ],
                    );
                  });
            }
          : () {
              return showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("Confirm Exit?"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context, true);
                            },
                            child: Text("Yes")),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text("No"),
                        )
                      ],
                    );
                  });
            },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: ReelAppBar(
          title: Text(
            "Reel Nepal",
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                })
          ],
        ),
        /*drawer: Drawer(
          child: ListView(
            children: <Widget>[

            ],
          ),
        ),*/

        /*cant pass future data from here without Futurebuilder no snapshot is obtained

        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Image(image: AssetImage('assets/images/reelnepal-logo.png')),
              ListTile(
                title: Text("Featured Movies"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FeaturedMoviesPage()));
                },
              ),
              */ /*ListTile(
                title: Text("Featured Actors"),
                onTap: () {
                  Navigator.pop(context);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => FeaturedActors()));
                },
              ),*/ /*
              ListTile(
                title: Text("Nepali News"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecentVideoPage()));
                },
              ),
              ListTile(
                title: Text("Top News"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TopNewsPage()));
                },
              ),
              ListTile(
                title: Text("Movie Calender"),
                onTap: () {
                  Navigator.pop(context);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => TopNews()));
                },
              ),
            ],
          ),
        ),*/
        body: FutureBuilder<FrontDataModel>(
          future: FrontDataService().getFrontData(),
          builder: (context, snapshot) {
            //print(snapshot.data.featuredMovies[2]);

            if (snapshot.hasError) return Text(snapshot.error.toString());
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: HomeMoviePane(data: snapshot.data.featuredMovies),
                    ),
                    Expanded(child: TopNewsPane(data: snapshot.data.topNews)),
                    Expanded(
                        child: RecentVideoPane(data: snapshot.data.topVideos)),
                  ],
                )
                    //Flexible(flex: 1, child: Text("hello")),
                    //TopNews(data: snapshot.data.topNews),
                    //VideoList(data: snapshot.data.topVideos)

                    ;
              }
            }
            print(snapshot.hasData);
            return Container();
          },
        ),

        /*bottomNavigationBar: BottomNavigationBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title:  Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), title:  Text("Movies")),
          BottomNavigationBarItem(icon: Icon(Icons.recent_actors), title:  Text("Actors")),
          BottomNavigationBarItem(icon: Icon(Icons.description), title:  Text("News")),
          BottomNavigationBarItem(icon: Icon(Icons.featured_video), title:  Text("Videos")),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },),*/
      ),
    );
  }
}

class HomeMoviePane extends StatelessWidget {
  final List<MovieModel> data;

  const HomeMoviePane({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured Movies",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeaturedMoviesPage(
                                    data: data,
                                  )));
                    },
                    child: Text(
                      "SEE ALL",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              //scrollDirection: Axis.horizontal,
              itemCount: data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10, crossAxisCount: 3),
              itemBuilder: (context, index) => Card(
                color: Colors.transparent,
                child: GridTile(
                  child: GestureDetector(
                    child: SizedBox(
                      height: 130,
                      child: CachedNetworkImage(
                        imageUrl: AppConfiguration.API_MOVIEBASE_URL +
                            data[index].coverPhoto,
                        fit: BoxFit.fill,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    onTap: () {
                      print(data[index].movieId);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                    movieId: data[index].movieId,
                                    title: data[index].name,
                                  )));
                    },
                  ),
                  //child: Text("$index"),

                  //footer: Text(data[index].name),
                  /*child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailPage(
                                    movieId: data[index].movieId,
                                  )));
                    },
                    child: Text(data[index].name),
                  ),*/
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopNewsPane extends StatelessWidget {
  final List<NewsModel> data;

  const TopNewsPane({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top News",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TopNewsPage(
                                    data: data,
                                  )));
                    },
                    child: Text(
                      "SEE ALL",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(data[index].title),
                  trailing: Text(data[index].publishedDate),
                  enabled: true,
                  subtitle: Text(data[index].refinedContent),
                  leading: CachedNetworkImage(
                    imageUrl: AppConfiguration.API_NEWSBASE_URL +
                        data[index].photoName,
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                  onTap: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecentVideoPane extends StatelessWidget {
  final List<VideoModel> data;

  const RecentVideoPane({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Videos",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  RecentVideoPage(data: data)));
                    },
                    child: Text(
                      "SEE ALL",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(data[index].title),
                  trailing: Text(data[index].publishedDate),
                  subtitle: Text(data[index].description ?? 'N/A'),
                  leading: CachedNetworkImage(
                    imageUrl: AppConfiguration.videoToThumbnail(
                        data[index].youTubeId),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                ),
              ),
              itemCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}
