import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sociable/Pages/Auth/authModel.dart';
import 'package:sociable/helper/config.dart';
import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';

class AuthRepository {
  Future<dynamic> loginProses(Auth auth) async {
    // print(auth..loginBody());
    http.Response res = await http.post(Uri.parse(EndPoint.login), body: auth.loginBody());
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      return Auth.fromJson(data);
    } else {
      return Auth.fromJson(data);
    }
  }

  Future<bool> register(Auth auth) async {
    print(auth.toJson());

    http.Response res = await http.post(Uri.parse(EndPoint.register), body: auth.toJson());
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> createChallenge() async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.createChallenge), headers: {'Authoriation': 'Bearer $token'});
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
