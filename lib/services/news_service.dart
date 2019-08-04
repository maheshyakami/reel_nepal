import 'package:reel_nepal/models/front/news_model.dart';
import 'package:reel_nepal/singletons.dart';

import 'http_service.dart';

class NewsService {
  Future<NewsModel> getNewsById(int newsId) async {
    dynamic result = await singletons<HttpService>().fetch('news/$newsId');
    return NewsModel.fromJson(result);
  }
}
