import 'dart:convert';
import 'resep.dart';
import 'package:http/http.dart' as http;

class ResepApi {
  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": '0', "size": '20', "tags": 'under_30_minutes'});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '2730e3f37fmsh3372843a002208ap1a9a10jsnf58eeb524b91',
      'X-RapidAPI-Host': 'tasty.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }
    return Resep.resepFromSnapshot(_temp);
  }
}
