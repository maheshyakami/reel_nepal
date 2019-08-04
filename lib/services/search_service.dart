import 'package:reel_nepal/models/front/search_model.dart';

import '../singletons.dart';
import 'http_service.dart';

class SearchService {
  Future<List<SearchModel>> search(String query) async {
    List<dynamic> result =
        await singletons<HttpService>().fetch('search/all?key=$query');
    return result
        .map<SearchModel>((resultItem) => SearchModel.fromJson(resultItem))
        .toList();
  }
}
