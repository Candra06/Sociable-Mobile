import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sociable/Pages/konten/models/konten_model.dart';
import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';

class KontenRepository {
  Future<List<KontenModel>> ListKonten() async {
    String token = await Pref.getToken();
    http.Response res = await http.get(
      Uri.parse(EndPoint.getArtikel),
      headers: {
        'Authorization': 'Bearer ' + token,
        "Accept": "application/json"
      },
    );
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      List<dynamic> list = data['data'];

      return list.map((e) => KontenModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
