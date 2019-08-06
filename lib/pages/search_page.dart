import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:reel_nepal/models/front/search_model.dart';
import 'package:reel_nepal/services/search_service.dart';

import '../singletons.dart';
import 'detail_pages/crew_detail_page.dart';
import 'detail_pages/movie_detail_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return TypeAheadField<SearchModel>(
        suggestionsCallback: singletons<SearchService>().search,
        itemBuilder: (context, searchModel) {
          return ListTile(
            leading: SizedBox(
              width: 50.0,
              child: searchModel.searchThumb == null
                  ? Container()
                  : Image.network(
                      searchModel.searchThumb,
                      fit: BoxFit.fitWidth,
                    ),
            ),
            title: Text(searchModel.name ?? ''),
          );
        },
        onSuggestionSelected: (searchModel) {
          if (searchModel.category == 'pr') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CrewDetailPage(crewId: searchModel.id)));
          }
          if (searchModel.category == 'mv') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailPage(movieId: searchModel.id)));
          }
        });
  }
}
