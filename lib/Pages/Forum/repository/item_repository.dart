import 'package:sociable/helper/network.dart';
import 'package:sociable/helper/pref.dart';
import 'package:http/http.dart' as http;

class ItemRepository {
  like(var id) async {
    String token = await Pref.getToken();
    http.Response res = await http.get(
      Uri.parse(EndPoint.likeForum(id)),
      headers: {
        'Authorization': 'Bearer ' + token,
        "Accept": "application/json"
      },
    );
    print(EndPoint.likeForum(id));
    print(res.body);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  unlike(var id, jumlahLike) async {
    if (jumlahLike > 0) {
      String token = await Pref.getToken();
      http.Response res = await http.get(
        Uri.parse(EndPoint.unlikeForum(id)),
        headers: {
          'Authorization': 'Bearer ' + token,
          "Accept": "application/json"
        },
      );
      print(EndPoint.unlikeForum(id));
      print(res.body);
      if (res.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
