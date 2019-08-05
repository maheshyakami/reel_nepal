import 'package:flutter/material.dart';
import 'package:reel_nepal/models/front/movie_model.dart';

class FeaturedMoviesPage extends StatefulWidget {
  final List<MovieModel> data;

  const FeaturedMoviesPage({Key key, this.data}) : super(key: key);

  @override
  _FeaturedMoviesPageState createState() => _FeaturedMoviesPageState();
}

class _FeaturedMoviesPageState extends State<FeaturedMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
