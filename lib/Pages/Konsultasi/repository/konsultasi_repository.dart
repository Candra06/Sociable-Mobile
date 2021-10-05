import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sociable/Pages/Konsultasi/model/detailRoom.dart';
import 'package:sociable/Pages/Konsultasi/model/psikolog.dart';
import 'package:sociable/Pages/Konsultasi/model/room.dart';
import 'package:sociable/Pages/Konsultasi/view/roomChat.dart';
import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';

class KonsultasiRepository {
  Future<List<Psikolog>> listPsikolog() async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.listPsikolog), headers: {'Authorization': 'Bearer ' + token});
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      List<dynamic> list = data['data'];
      return list.map((e) => Psikolog.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<Room>> listRoom() async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.lsitRoom), headers: {'Authorization': 'Bearer ' + token});
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      List<dynamic> list = data['data'];
      return list.map((e) => Room.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<DetailRoom>> detailRoom(String id) async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.detailChat(id)), headers: {'Authorization': 'Bearer ' + token});
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      List<dynamic> list = data['data'];
      return list.map((e) => DetailRoom.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<dynamic> send(DetailRoom detail) async {
    print(detail.toJson());
    var token = await Pref.getToken();
    http.Response res = await http.post(Uri.parse(EndPoint.createChat),
        headers: {
          'Authorization': 'Bearer ' + token,
        },
        body: detail.toJson());
    var data = json.decode(res.body);
    print(data);
    if (res.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }
}
