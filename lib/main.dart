import 'package:flutter/material.dart';
import 'PageView/PageList.dart';

void main(){
  runApp(MaterialApp(
    home: PageList(),
    title: "Previsão do Tempo",
    theme: ThemeData(hintColor: Colors.black),
  ));
}