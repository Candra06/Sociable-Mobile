import 'package:http/http.dart' as http;
import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';

class ChallengeRepository {
  Future<bool> insertChallenge() async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.createChallenge), headers: {'Authorization': 'Bearer $token'});

    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
