import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:previsao_tempo/Tiles/DrawerTile.dart';

class WeatherForecast extends StatefulWidget {
  final PageController pageController;

  WeatherForecast(this.pageController);

  @override
  _WeatherForecastState createState() => _WeatherForecastState(pageController);
}

class _WeatherForecastState extends State<WeatherForecast> {
  final PageController pageController;

  _WeatherForecastState(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Previsão do Tempo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: _buildDrawer(),
      body: Center(
        child: Text(
          "TELA AINDA NÃO IMPLEMENTADA",
          style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                //height: 170.0,
                child: Text(
                  "Nome Aplicativo",
                  style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
                ),
              ),
              DrawerTile(
                  Image.asset(
                    "images/icon_TempoAtual.png",
                    height: 32.0,
                    width: 32.0,
                  ),
                  "Tempo Atual",
                  0,
                  pageController),
              DrawerTile(
                  Image.asset(
                    "images/icon_PrevisaoTempo.png",
                    height: 32.0,
                    width: 32.0,
                  ),
                  "Previsão do Tempo",
                  1,
                  pageController),
            ],
          ),
        ],
      ),
    );
  }
}
