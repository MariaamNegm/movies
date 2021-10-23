import 'package:flutter/material.dart';
import  'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';
class screentag extends StatefulWidget {
  String?title;
  String?date;
  @override
  // ignore: override_on_non_overriding_member

  _screentagState createState() => _screentagState();
  screentag({this.title,this.date});


}

class _screentagState extends State<screentag> {

  Future<void>openlink(String link)async{
    if(await canLaunch(link))
    {
      await launch(link);
    }
    else
    {
      await launch(link);
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body:ListView(
        children: [
          IconButton(onPressed:(){

            String x= check();
            print("$x");
            String y="https://faze.egybest.pet/movie/$x-${widget.date!.substring(0,4)}";
            print("$y");
            openlink("https://faze.egybest.pet/movie/$x-${widget.date!.substring(0,4)}");

          }, icon:Icon(Icons.open_in_browser,size: 40,color: Colors.black87,))
          //
        ],
      )

    );
  }

  String check() {
    if( widget.title!.contains(" "))
    {
     String url= widget.title!.replaceAll(" ", "-").toLowerCase();
     print("$url");
     return url;
    }
    else{

      return widget.title!.replaceAll(" ", " ").toLowerCase();

    }
  }
}
