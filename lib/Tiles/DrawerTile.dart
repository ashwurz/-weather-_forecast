import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final Image image;
  final String text;
  final int page;
  final PageController pageController;

  DrawerTile(this.image, this.text, this.page, this.pageController);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: GestureDetector(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
              pageController.jumpToPage(page);
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
        ));
  }
}
