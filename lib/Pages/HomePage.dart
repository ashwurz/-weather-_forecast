import 'package:flutter/cupertino.dart';
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
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${currentWeather.getCidade()}",
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Vento: ${currentWeather.getVelVento()}",
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "${currentWeather.getData()}",
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Umidade: ${currentWeather.getHumidade()}%",
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Nascer do sol: ${currentWeather.getHoraAmanhecer()}",
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Pôr do sol: ${currentWeather.getHoraAnoitecer()}",
                              style: TextStyle(fontSize: 12.0),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Última atualização: ${currentWeather.getHoraAtualizacao()} hrs",
                              style: TextStyle(
                                  fontSize: 12.0, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.transparent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _getTempoAtual(snapshot),
                            Text(
                              "${currentWeather.getTemperatura()}ºC",
                              style: TextStyle(
                                  fontSize: 70.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Text(
                              "${currentWeather.getTempo()}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                                labelText: "Pesquisar por cidade",
                                labelStyle: TextStyle(color: Colors.black),
                                border: OutlineInputBorder(),
                                prefixText: "Cidade: "),
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                            textAlign: TextAlign.left,
                            onSubmitted: (text) {
                              setState(() {
                                connection.searchString = text;
                              });
                            },
                          ),
                        ),
                      ],
                    ));
              }
          }
        },
      ),
    );
  }

  Widget _getTempoAtual(AsyncSnapshot snapshot) {
    String tempo = snapshot.data["results"]["condition_slug"].toString();
    return _returnImage(snapshot, tempo);
  }

  Widget _returnImage(AsyncSnapshot snapshot, String condition) {
    return Image.asset(
      "images/$condition.png",
      height: 120.0,
      width: 120.0,
    );
  }

  void setCurrentWeather(AsyncSnapshot snapshot, CurrentWeather current) {
    current.setTemperatura(snapshot.data["results"]["temp"].toString());
    current.setData(snapshot.data["results"]["date"].toString());
    current.setTempo(snapshot.data["results"]["description"].toString());
    current.setDiaOuNoite(snapshot.data["results"]["currently"].toString());
    current.setCidade(snapshot.data["results"]["city_name"].toString());
    current.setHumidade(snapshot.data["results"]["humidity"].toString());
    current.setVelVento(snapshot.data["results"]["wind_speedy"].toString());
    current.setHoraAmanhecer(snapshot.data["results"]["sunrise"].toString());
    current.setHoraAnoitecer(snapshot.data["results"]["sunset"].toString());
    current.setHoraAtualizacao(snapshot.data["results"]["time"].toString());
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
