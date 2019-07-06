import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final Image image;
  final String text;

  DrawerTile(this.image,this.text); 

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              image,
              SizedBox(width: 32.0,),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}