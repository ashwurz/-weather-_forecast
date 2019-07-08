import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:previsao_tempo/Tiles/DrawerTile.dart';

class WeatherForecast extends StatefulWidget {
  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
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
      child: ListView(
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
              1),
          DrawerTile(
              Image.asset(
                "images/icon_PrevisaoTempo.png",
                height: 32.0,
                width: 32.0,
              ),
              "Previsão do Tempo",
              2),
        ],
      ),
    );
  }
}
