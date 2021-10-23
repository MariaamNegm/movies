// ignore: file_names
// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/apis/popular.dart';
import 'package:movies/apis/toprated.dart';

import 'dis.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  String url='https://image.tmdb.org/t/p/w500/';
    // ignore: prefer_const_constructors
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black87,

           // ignore: prefer_const_constructors
           title: Text("Movies_App",style: TextStyle(
             color: Colors.white,
             fontSize: 35,
           ),),
          // ignore: prefer_const_literals_to_create_immutables
          actions:[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.doorbell,color: Colors.white,size: 30,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search,color: Colors.white,size: 30,),
            ),
          ],

        ),
        body:SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,top: 10),
                  child: Text(
                    "Top_Rated :",style: TextStyle(
                    color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 250,
                      child: Consumer(builder: (BuildContext context,   watch, child) {
                        var viewmodel=watch(getprovideroftoprated);
                        return ListView.builder(

                          scrollDirection: Axis.horizontal,
                          itemCount: viewmodel.listofmovies.length,
                          itemBuilder: (BuildContext context, int i)
                          {

                            // ignore: prefer_const_constructors
                            return Container(
                              height: 250,
                              child:  Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    // ignore: prefer_const_constructor
                                  ),
                                  height: 200,
                                  width: 190,
                                  child:GestureDetector(
                                    onTap: ()
                                    {
                                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return dis( poster_path: viewmodel.listofmovies[i].poster_path,title: viewmodel.listofmovies[i].title,id: viewmodel.listofmovies[i].id,overview: viewmodel.listofmovies[i].overview,vote_average: viewmodel.listofmovies[i].vote_average,release_date:viewmodel.listofmovies[i].release_date ); } ));
                                    },
                                    child: Card(
                                      elevation:10,
                                      shadowColor: Colors.black.withOpacity(0.2),
                                      color: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40.0),
                                      ),
                                      child:Container(
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          // ignore: prefer_const_constructors
                                          image: DecorationImage(
                                              image: NetworkImage(url+"${viewmodel.listofmovies[i].poster_path}"),
                                              fit:BoxFit.cover
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );

                          },);

                      }, ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,top: 10,bottom: 10),
                  child: Text(
                    "Popular :",style: TextStyle(
                      color: Colors.black87,fontSize: 30,fontWeight: FontWeight.bold
                  ),
                  ),
                ),
                Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          height: 400,
                          child: Consumer(builder: (BuildContext context,   watch, child) {
                            var viewmodel=watch(getproviderofpopular);
                            return  GridView.builder(

                              scrollDirection: Axis.vertical,
                              itemCount: viewmodel.listofmovies.length,
                              itemBuilder: (BuildContext context, int i)
                              {

                                // ignore: prefer_const_constructors
                                return Container(
                                  height: 200,
                                  child:  Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
                                        // ignore: prefer_const_constructor
                                      ),
                                      height: 200,
                                      width: 200,
                                      child:GestureDetector(
                                        onTap: ()
                                        {
                                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { return dis( poster_path: viewmodel.listofmovies[i].poster_path,title: viewmodel.listofmovies[i].title,id: viewmodel.listofmovies[i].id,overview: viewmodel.listofmovies[i].overview,vote_average: viewmodel.listofmovies[i].vote_average,release_date:viewmodel.listofmovies[i].release_date ,); } ));
                                        },
                                        child: Card(
                                          elevation:10,
                                          shadowColor: Colors.black.withOpacity(0.2),
                                          color: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(40.0),
                                          ),
                                          child:Container(
                                            width: 190,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              // ignore: prefer_const_constructors
                                              image: DecorationImage(
                                                  image: NetworkImage(url+"${viewmodel.listofmovies[i].poster_path}"),
                                                  fit:BoxFit.cover
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );

                              }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (crossAxisCount: 2),);

                          }, ),
                        ),
                      ),
                SizedBox(height: 10),
              ],
            ),
          ),
        )
      ),
    );
  }
}
