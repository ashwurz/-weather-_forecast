import 'package:http/http.dart' as http;
import 'dart:convert';

class HgWeatherConnection{
  String _url = "https://api.hgbrasil.com/weather?key=d5a4b5ec&user_ip=remote";

  String searchString;

  Future<Map> getResponse() async{
    http.Response response;

    if(searchString == null || searchString.isEmpty){
      response = await http.get(_url);
    }else{
      response = await http.get(_getSearchResponse(searchString));
    }

    return json.decode(response.body);
  }

  String _getSearchResponse(String search){
    return "https://api.hgbrasil.com/weather?key=d5a4b5ec&city_name=$search";
  }
}