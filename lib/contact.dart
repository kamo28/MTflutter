import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'dart:io';

class contacto extends StatefulWidget{
  @override 
  _contactoState createState() => _contactoState();
}

class _contactoState extends State<contacto>{
  enviarSMS(String msj, List<String> d) async {
    String r = await sendSMS(message: msj, recipients: d).catchError((onError) {
      print(onError);
    });
    print(r);
  }

  hacerLlamada() async {
    const url = 'tel:+525587920511';
    if (await canLaunch(url)) {
      await launch(url);
    }else{
      throw 'error al llamar la $url';
    }
  }

  openwhatsapp(String message, String destinatario) async {
    var whatsapp = destinatario;
    var whatsappURl_android =
        "whatsapp://send?phone=" + whatsapp + "&text=" + message;
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse(message)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURL_ios)) {
        await launch(whatappURL_ios, forceSafariVC: false);
      } else {
        try {
          launch(whatappURL_ios, forceSafariVC: false);
        }
        catch (e)
        {
          print(e);
          print("WhatsApp no instalado");
          // although the exception occurs, this never happens, and I would rather catch the exact canLaunch exception
        }
      }
    } else {
      // android , web
      print(whatsappURl_android);
      if (await canLaunch(whatsappURl_android)) {
        await launch(whatsappURl_android);
      } else {
        try {
          launch(whatsappURl_android);
        }
        catch (e)
        {
          print(e);
          print("WhatsApp no instalado");
          // although the exception occurs, this never happens, and I would rather catch the exact canLaunch exception
        }
      }
    }
  }

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('¡Contáctanos!'),
          backgroundColor: Colors.orange
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                width: 100.0,
                child: TextButton(
                  child: Text('Llamada', style: TextStyle(fontSize: 20.0)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white
                  ),
                  onPressed: hacerLlamada
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                width: 100.0,
                child: TextButton(
                  child: Text('SMS', style: TextStyle(fontSize: 20.0)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white
                  ),
                  onPressed: (){
                    String msj = "¡Quiero hacer un pedido!";
                    List<String> d = ["+52 1 5587920511"];
                    enviarSMS(msj, d);
                  }
                ),
              ),
              Container(
                margin: EdgeInsets.all(30),
                width: 120.0,
                child: TextButton(
                  child: Text('WhatsApp', style: TextStyle(fontSize: 20.0)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white
                  ),
                  onPressed: (){
                    String mensaje = "Me gustaría hacer una reservación";
                    String destinatario = "+52 1 5587920511";
                    openwhatsapp(mensaje, destinatario);
                  }
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}