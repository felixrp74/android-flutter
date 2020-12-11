import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android/models/celular_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CelularAPI { 
  
  // SharedPreferences sharedPreferences  = await SharedPreferences.getInstance();
  
  final _dio = Dio();

  // String token = "";
  final String postUrl = "http://192.168.0.103:8000/api/habilidad";
  // final String postUrl = "http://192.168.0.108:8000/api/celular";

  

  Future <List<Celular>> getCelular() async {
  
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    String bearer = "Bearer ";
    String token = sharedPreferences.getString("token");
    String llave = bearer + token;

    print(  "-================llave========$llave=================" ) ;


    try {
      // sharedPreferences = await SharedPreferences.getInstance();
      // String token = "Bearer "+sharedPreferences.getString("token");

      var headerList = <String, String>{};

      headerList['Authorization'] = llave;
        
      http.Response res = await http.get(
        postUrl,
        headers: headerList
      );

      print("=============>${res.statusCode}");

      if ( res.statusCode == 200 ) {
        print("=============DANCING============");
        List<dynamic> body = jsonDecode(res.body);

        List<Celular> celular = 
          body.map((dynamic item) => Celular.fromJson(item)).toList();

        return celular;

      }else {
        print("=============DARK============");
        throw "cant get posts";
      }
 

    } catch (e){
       print("================== > ERROR");
      print(e);
    }


  }

}