import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sociable/Pages/Challenges/model/challenge_model.dart';
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

  Future<List<Challenge>> list() async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.showChallenge), headers: {'Authorization': 'Bearer $token'});
    var data = json.decode(res.body);
    if (res.statusCode == 200) {
      List<dynamic> tmp = data['data'];
      return tmp.map((e) => Challenge.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Challenge> detail(String id) async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.detailChallenge(id)), headers: {'Authorization': 'Bearer $token'});
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      return Challenge.fromJson(data['data']);
    } else {
      return Challenge.fromJson(data['data']);
    }
  }

  Future<bool> finish(String id) async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.finishChallenge(id)), headers: {'Authorization': 'Bearer $token'});
    print(res.body);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
