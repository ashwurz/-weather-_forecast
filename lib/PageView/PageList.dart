import 'package:flutter/material.dart';
import 'package:previsao_tempo/Pages/HomePage.dart';
import 'package:previsao_tempo/Pages/WeatherForecast.dart';

class PageList extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePage(_pageController),
        WeatherForecast(_pageController),
      ],
    );
  }
}