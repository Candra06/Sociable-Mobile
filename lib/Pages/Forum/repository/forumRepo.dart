import 'package:http/http.dart' as http;
import 'package:sociable/Pages/Forum/model/detailForum.dart';
import 'dart:convert';

import 'package:sociable/Pages/Forum/model/forum.dart';
import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';

class ForumRepository {
  Future<List<Forum>> listForum() async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.listForum), headers: {'Authorization': 'Bearer ' + token});
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      List<dynamic> list = data['data'];
      return list.map((e) => Forum.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<DetailForum> detailForum(String id) async {
    var token = await Pref.getToken();
    print(id);
    http.Response res = await http.get(Uri.parse(EndPoint.detailForum(id)), headers: {'Authorization': 'Bearer ' + token});
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      return DetailForum.fromJson(data);
    } else {
      return DetailForum.fromJson(data);
    }
  }
}
