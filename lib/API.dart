import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medio_termino/about.dart';

class _campo_numeroState extends State<campo_numero> {
  TextEditingController n = new TextEditingController();
  _campo_numeroState(this.n);
  String s = "";
  void dato() {
    setState(() {
      s = n.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(10),
        ),
        new Flexible(
          child: new TextField(
            keyboardType: TextInputType.number,
            controller: n,
          )
        )
      ],
    );
  }
}

String url = "https://www.ahumados.shop/wp-content/uploads/2021/06/1625078774_53_image"; 
class obteniendodatosapi {
  Future<regreso> getdatos(String id) async {
    if(id == '1'){
      id = '25';
    } else if(id == '2'){
      id = '2';
    }else if(id == '3'){
      id = '5';
    }else if(id == '4'){
      id = '7';
    }else if(id == '5'){
      id = '8';
    }else if(id == '6'){
      id = '10';
    }else if(id == '7'){
      id = '12';
    }else if(id == '8'){
      id = '14';
    }else if(id == '9'){
      id = '23';
    }else if(id == '10'){
      id = '24';
    }else if(id == '11'){
      id = '26';
    }else{
      id = '18';
    }
    
    String myurl = 'https://foodish-api.herokuapp.com/images/pasta/pasta' + id + '.jpg';

    print(myurl);
    url = myurl;
    regreso r = regreso(id: id);
    return r;
  }

  String geturl() {
    return url;
  }
}

obteniendodatosapi img = new obteniendodatosapi();
class regreso {
  String id = "";
  regreso({required this.id});
}

class campo_numero extends StatefulWidget {
  TextEditingController n = new TextEditingController();
  campo_numero(this.n);
  _campo_numeroState createState() => _campo_numeroState(this.n);
}

class bodyAPI extends StatefulWidget {
  _bodyAPIState createState() => _bodyAPIState();
}

class _bodyAPIState extends State<bodyAPI>{
  String id = "";
  String idtexto = '';
  TextEditingController textbox = new TextEditingController();  

  Future<void> dato() async {
    obteniendodatosapi dat = new obteniendodatosapi();
    regreso r = await dat.getdatos(textbox.text);

    setState(() {
      String w = r.id;
      idtexto = w.toString();
    });

    id = r.id;
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Nuestros tipos de pasta"),
        centerTitle: true,
        backgroundColor: Colors.orange
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Text(
                    '\n\nEscoja entre nuestra variedad de pastas:\n1. Spaguetti Bolognesa\n2. Spaguetti Carbonara\n3. Spaguetti Arrabiata\n4. Spaguetti Cherry\n5. Spaguetti Pomodoro\n6. Spaguetti con salchicha\n7. Penne con champiñones a la paprika\n8. Spaguetti al pesto\n9. Spaguetti con aceitunas\n10. Ravioli arrabiata\n11. Spaguetti con camarones',
                    textAlign: TextAlign.justify
                  ),
                  Text("\n\n"),
                  Text("Ingrese ID del platillo"),
                  Text("\n\n"),
                  campo_numero(textbox),
                  ElevatedButton(
                    onPressed: (){
                      dato();
                    },
                    child: Text("Ver imagen correspondiente")
                  ),
                  Text("\n\n"),
                  Image.network(
                    img.geturl(),
                    width: MediaQuery.of(context).size.width * .75,
                  ),
                  Text('\n\n')
                ],
              )
            )
          ]
        )
      )
    );
  }
}