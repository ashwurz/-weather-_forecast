import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:previsao_tempo/Pages/HomePage.dart';
import 'package:previsao_tempo/Pages/WeatherForecast.dart';

class DrawerTile extends StatelessWidget {
  final Image image;
  final String text;
  final int page;

  DrawerTile(this.image, this.text, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          if (page == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (page == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeatherForecast()));
          }
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              image,
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
