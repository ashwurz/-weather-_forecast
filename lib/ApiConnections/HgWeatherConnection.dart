import 'package:http/http.dart' as http;
import 'dart:convert';

class HgWeatherConnection{
  String url = "https://api.hgbrasil.com/weather?key=d5a4b5ec&user_ip=remote";

  Future<Map> getResponse() async{
    http.Response response = await http.get(url);

    return json.decode(response.body);
  }
}