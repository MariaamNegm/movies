import 'package:flutter/material.dart';
import 'package:movies/screens/screentag.dart';
import 'package:movies/screens/web.dart';

class dis extends StatelessWidget {
  int? id;
  String? overview;
  String? poster_path;
  String? title;
  num? vote_average;
  String?release_date;

  dis(
      {this.vote_average,
      this.poster_path,
      this.title,
      this.overview,
      this.id,
      this.release_date});

  @override
  Widget build(BuildContext context) {
    String url = 'https://image.tmdb.org/t/p/w500/';

    return Scaffold(
      backgroundColor: Colors.black87.withOpacity(1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               Row(
                 children: [
                   Container(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: IconButton(onPressed: () {
                       Navigator.pop(context);
                     }, icon:Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),),
                   ),
                 ),
                    ],
               ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "${release_date!.substring(0,4)}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 400,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      // ignore: prefer_const_constructor
                    ),
                    height: 900,
                    width: 200,
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.black.withOpacity(0.2),
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Container(
                        width:  200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          // ignore: prefer_const_constructors
                          image: DecorationImage(
                              image: NetworkImage(url + "${poster_path}"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "${title}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "vote_average : ${vote_average}/10",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only( right: 270),
                child: Text(
                  "OverView :",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "${overview}",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              SizedBox(height: 70),
            ],
          ),
        )
      ),
      floatingActionButton:Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton.extended(

          onPressed: () { Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) {
            return  screentag(title:this.title,date: this.release_date);
          } )); },
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),


          ),
          elevation: 20,

          backgroundColor: Colors.white.withOpacity(1), label:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Watch on EGYBEST",style: TextStyle(
            fontSize: 20,color: Colors.black87
          ),),
        ),


        ),
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
