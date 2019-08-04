import 'package:reel_nepal/models/front/crew_model.dart';

import '../singletons.dart';
import 'http_service.dart';

class CrewService {
  Future<CrewModel> getCrewById(int crewId) async {
    dynamic result = await singletons<HttpService>().fetch('crew/$crewId');
    return CrewModel.fromJson(result);
  }
}
