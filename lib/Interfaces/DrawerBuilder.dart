// import 'package:flutter/material.dart';
// import 'package:previsao_tempo/Tiles/DrawerTile.dart';

// abstract class DrawerBuilder {
//   Widget buildDrawer() {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.only(left: 32.0, top: 16.0),
//         children: <Widget>[
//           Container(
//             margin: EdgeInsets.only(bottom: 8.0),
//             padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
//             //height: 170.0,
//             child: Text(
//               "Nome Aplicativo",
//               style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
//             ),
//           ),
//           DrawerTile(
//               Image.asset(
//                 "images/hot.png",
//                 height: 32.0,
//                 width: 32.0,
//               ),
//               "Tempo Atual",
//               1),
//           DrawerTile(
//               Image.asset(
//                 "images/sun.png",
//                 height: 32.0,
//                 width: 32.0,
//               ),
//               "Previsão do Tempo",
//               2),
//         ],
//       ),
//     );
//   }
// }
