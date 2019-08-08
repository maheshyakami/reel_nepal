import 'package:reel_nepal/models/front/video_model.dart';
import 'package:reel_nepal/singletons.dart';

import 'http_service.dart';

class VideoService {
  Future<VideoModel> getVideoById(int videoId) async {
    dynamic result = await singletons<HttpService>().fetch('news/$videoId');
    return VideoModel.fromJson(result);
  }
}
