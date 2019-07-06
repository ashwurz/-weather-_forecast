import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:previsao_tempo/ApiConnections/HgWeatherConnection.dart';
import 'package:previsao_tempo/Tiles/DrawerTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HgWeatherConnection teste = HgWeatherConnection();

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
                "images/hot.png",
                height: 32.0,
                width: 32.0,
              ),
              "Tempo Atual"),
          DrawerTile(
              Image.asset(
                "images/sun.png",
                height: 32.0,
                width: 32.0,
              ),
              "Previsão do Tempo"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Tempo Atual",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: _buildDrawer(),
    );
  }
}
