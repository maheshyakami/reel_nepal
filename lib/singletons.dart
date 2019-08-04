import 'package:get_it/get_it.dart';
import 'package:reel_nepal/services/crew_service.dart';
import 'package:reel_nepal/services/front_data_service.dart';
import 'package:reel_nepal/services/http_service.dart';
import 'package:reel_nepal/services/movie_service.dart';
import 'package:reel_nepal/services/news_service.dart';
import 'package:reel_nepal/services/search_service.dart';

GetIt singletons = GetIt();

class Singletons {
  static void register() {
    singletons.registerLazySingleton(() => HttpService());
    singletons.registerLazySingleton(() => SearchService());
    singletons.registerLazySingleton(() => CrewService());
    singletons.registerLazySingleton(() => MovieService());
    singletons.registerLazySingleton(() => NewsService());
    singletons.registerLazySingleton(() => FrontDataService());
  }
}
