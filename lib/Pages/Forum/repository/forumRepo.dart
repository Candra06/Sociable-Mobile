import 'package:http/http.dart' as http;
import 'package:sociable/Pages/Forum/model/comment_model.dart';
import 'package:sociable/Pages/Forum/model/detailForum.dart';
import 'dart:convert';

import 'package:sociable/Pages/Forum/model/forum.dart';

import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';

class ForumRepository {
  Future<List<Forum>> listForum() async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.listForum),
        headers: {'Authorization': 'Bearer ' + token});
    var data = json.decode(res.body);
    // print(data);
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
    http.Response res = await http.get(Uri.parse(EndPoint.detailForum(id)),
        headers: {'Authorization': 'Bearer ' + token});
    var data = json.decode(res.body);
    // print(data);
    if (res.statusCode == 200) {
      print(data);
      return DetailForum.fromJson(data);
    } else {
      return DetailForum.fromJson(data);
    }
  }

  Future<bool> postForum(Forum forum) async {
    var token = await Pref.getToken();
    print(forum.toJson());
    http.Response res = await http.post(Uri.parse(EndPoint.addForum),
        headers: {'Authorization': 'Bearer ' + token}, body: forum.toJson());
    // print(res.body);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<CommentModel>> listComment(var id) async {
    var token = await Pref.getToken();
    http.Response res = await http.get(
      Uri.parse(EndPoint.detailForum(id)),
      headers: {'Authorization': 'Bearer ' + token},
    );
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print(data['reply']);
      List<dynamic> list = data['reply'];
      return list.map((e) => CommentModel.fromJson(e)).toList();
      // return hasil;
      // print(res.body['reply']);
    } else {
      return [];
    }
  }
}
