import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sociable/Pages/Auth/Diagnosa/question_model.dart';
import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';

class DiagnosaRepository {
  Future<List<Question>> showQuestion() async {
    var token = await Pref.getToken();
    http.Response res = await http.get(Uri.parse(EndPoint.showQuestion), headers: {'Authorization': 'Bearer $token'});
    var data = json.decode(res.body);
    if (res.statusCode == 200) {
      List<dynamic> tmp = data['data'];
      return tmp.map((e) => Question.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<dynamic> answerQuestion(Question question) async {
    var token = await Pref.getToken();
    print(question.toJson());
    http.Response res = await http.post(Uri.parse(EndPoint.answer), headers: {'Authorization': 'Bearer $token'}, body: question.toJson());
    var data = json.decode(res.body);
    // print(data);
    if (res.statusCode == 200) {
      return data;
    } else {
      return data;
    }
  }
}
