import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class imagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network("https://ichef.bbci.co.uk/news/976/cpsprodpb/1337D/production/_98671787_mediaitem98671784.jpg"),
    );
  }
}

class imagen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network("https://static.standard.co.uk/s3fs-public/thumbnails/image/2017/11/08/16/carluccio-s-italian-restaurant-earlsfield.jpg?width=1200&width=1200&auto=webp&quality=75"),
    );
  }
}

class descripcion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: Text(
        'Concepto:\nLas personas que se reúnen en nuestro concepto tienen una cualidad en común: disfrutar la vida, compartir su espontaneidad y el auténtico compañerismo. Familiares-amigos y extraños pueden disfrutar de un tiempo relajado juntos. \n\nUna experiencia única al paladar:\nLas pastas, pizzas, antipasti y ensaladas se piden directamente a los chefs en cada estación en Vapiano. Los chefs preparan todos los platillos que les solicitan frente cada invitado. \nCada persona decide como quiere que se prepare su comida según sus propias preferencias. Nuestra masa de pizza, salsas y aderezos, así como nuestro pesto también se preparan en casa y podemos garantizar que se realizan con los ingredientes más frescos. \n\nCualquier momento es bueno: \nAquellos invitados que quieran disfrutar de un café o una copa después de cenar, podrán dirigirse a la zona de bar/lounge. Carluccio\'\s Pastas es la herramienta perfecta para una comida rápida, un break por la tarde o una agradable cena con amigos o familia.',
        textAlign: TextAlign.justify,
        style: GoogleFonts.oswald(fontSize: 23),
      ),
    );
  }
}

class acerca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Carluccio's Pastas"), backgroundColor: Colors.orange,),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[imagen(), descripcion(), imagen2()],
        ),
      )
    );
  }
}