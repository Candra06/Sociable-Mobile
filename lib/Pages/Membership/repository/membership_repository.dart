import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sociable/Pages/Membership/model/membership_model.dart';
import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';

class MemberRepository {
  Future<dynamic> getMembership() async {
    var token = await Pref.getToken();
    print(token);
    http.Response res = await http.get(Uri.parse(EndPoint.getMember), headers: {'Authorization': 'Bearer $token'});
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      return Membership.fromJson(data);
    } else {
      return Membership.fromJson(data);
    }
  }
}
