import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies/models/movies.dart';
final getprovideroftoprated=ChangeNotifierProvider.autoDispose<toprated>((ref)=>toprated());
class toprated extends ChangeNotifier{

  List<movies>listofmovies=[];
  toprated()
  {
    getdata();
  }

   Future getdata() async{
    listofmovies=[];

    try{
      String Api_Key="7493476305ac52d438c2e1f5d2c71096";
      var url =Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=${Api_Key}&language=en-US&page=1");
      print("hna url");
      var response= await http.get(url);
      var responsebody=jsonDecode(response.body)['results'];
      for(int i=0;i<responsebody.length;i++)
        {
          listofmovies.add(movies.fromMap(responsebody[i]));
          
        }


    }catch(e)
     {
       print("the error is $e");
     }

   }
   @override
   notifyListeners() ;

}
