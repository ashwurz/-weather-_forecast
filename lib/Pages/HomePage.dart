import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:previsao_tempo/ApiConnections/HgWeatherConnection.dart';
import 'package:previsao_tempo/Helpers/CurrentWeather.dart';
import 'package:previsao_tempo/Tiles/DrawerTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HgWeatherConnection connection = HgWeatherConnection();

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
      body: FutureBuilder<Map>(
        future: connection.getResponse(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Container(
                width: 200.0,
                height: 200.0,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 5.0,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 150.0,
                      ),
                      Text(
                        "Algo de errado aconteceu...",
                        style: TextStyle(color: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          height: 50.0,
                          child: RaisedButton(
                            child: Text(
                              "Tentar Reconexão",
                              style: TextStyle(color: Colors.black),
                            ),
                            color: Colors.white,
                            onPressed: connectionRetry,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                CurrentWeather currentWeather = CurrentWeather();
                setCurrentWeather(snapshot, currentWeather);

                return SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Temperatura: ${currentWeather.getTemperatura()}ºC",
                            style: TextStyle(fontSize: 20.0),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }

  void setCurrentWeather(AsyncSnapshot snapshot, CurrentWeather current) {
    current.setTemperatura(snapshot.data["results"]["temp"].toString());
    current.setData(snapshot.data["results"]["date"].toString());
    current.setTempo(snapshot.data["results"]["description"].toString());
    current.setDiaOuNoite(snapshot.data["results"]["currently"].toString());
    current.setCidade(snapshot.data["results"]["city"].toString());
    current.setHumidade(snapshot.data["results"]["humidity"].toString());
    current.setVelVento(snapshot.data["results"]["wind_speedy"].toString());
    current.setHoraAmanhecer(snapshot.data["results"]["sunrise"].toString());
    current.setHoraAnoitecer(snapshot.data["results"]["sunset"].toString());
  }

  void connectionRetry() {
    setState(() {
      build(context);
    });
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
}
