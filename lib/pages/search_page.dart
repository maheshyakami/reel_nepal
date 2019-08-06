import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:reel_nepal/models/front/search_model.dart';
import 'package:reel_nepal/services/search_service.dart';
import 'package:reel_nepal/widgets/reel_appbar.dart';

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
    return Scaffold(
      appBar: ReelAppBar(
        title: Text(
          "Search on Reel Nepal",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: TypeAheadField<SearchModel>(
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
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CrewDetailPage(
                            crewId: searchModel.id,
                            title: searchModel.name,
                          )));
            }
            if (searchModel.category == 'mv') {
              Navigator.pop(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                            movieId: searchModel.id,
                            title: searchModel.name,
                          )));
            }
          }),
    );
  }
}
