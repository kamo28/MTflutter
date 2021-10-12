import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class _sitioState extends State<sitio>{
  @override 
  Widget build(BuildContext context){
    return WebView(
      initialUrl: widget.url,
    );
  }
}

class sitio extends StatefulWidget {
  final String url;
  const sitio(this.url);

  @override 
  _sitioState createState() => _sitioState();
}
