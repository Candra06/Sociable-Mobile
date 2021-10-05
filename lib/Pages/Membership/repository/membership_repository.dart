import 'dart:convert';
import 'dart:io';

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

  Future<bool> store(File bukti) async {
    String token = await Pref.getToken();

    Map<String, String> headers = {
      'Authorization': 'Bearer ' + token,
    };
    var res2;
    final request = http.MultipartRequest('POST', Uri.parse(EndPoint.post));
    request.files.add(await http.MultipartFile.fromPath('bukti', bukti.path));
    request.fields['amount'] = 300000.toString();
    request.headers.addAll(headers);
    // res2 = await request.send();

    http.Response response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
