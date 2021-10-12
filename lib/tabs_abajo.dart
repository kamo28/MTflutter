import 'package:flutter/material.dart';
import 'package:medio_termino/API.dart';
import 'sitio_web.dart';
import 'contact.dart';
import 'about.dart';

class tabsabajo extends StatefulWidget {
  @override
  _tabsabajoState createState() => _tabsabajoState();
}

class _tabsabajoState extends State<tabsabajo> {
  int mi_indice = 0;
  final pantallas = <Widget>[
    acerca(),
    contacto(),
    sitio("https://italiannis.com.mx/"),
    bodyAPI()
  ];

  @override 
  Widget build(BuildContext context){
    return MaterialApp( 
      home: Scaffold(
        body: IndexedStack(
          index: mi_indice,
          children: pantallas
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.orange,
          selectedItemColor: Colors.white,
          iconSize: 40,
          currentIndex: mi_indice,
          onTap: (index) => setState(()=> mi_indice = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Acerca'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Contacto'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Sitio'),
            BottomNavigationBarItem(icon: Icon(Icons.food_bank), label: 'Menú')
          ],
        )
      )
    );
  }
}