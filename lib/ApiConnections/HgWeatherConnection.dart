import 'package:http/http.dart' as http;
import 'dart:convert';

class HgWeatherConnection{
  String _url = "https://api.hgbrasil.com/weather?key=fe71e003&user_ip=remote";


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
    return "https://api.hgbrasil.com/weather?key=fe71e003&city_name=$search";
  }
}