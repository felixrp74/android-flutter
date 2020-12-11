
import 'dart:convert';

import 'package:android/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {

  SharedPreferences sharedPreferences;
  
  final String postUrl = "http://192.168.0.108:8000/api/celular";
  // final String postUrl = "http://192.168.43.104:8000/api/celular";
  

  // Future <List<Post>> getPosts(String tokencito) async {
  Future <List<Post>> getPosts() async {

    
    
    sharedPreferences = await SharedPreferences.getInstance();
    String tokencito = "Bearer "+sharedPreferences.getString("token");
    print("-==-=-=-=-=-=-------${tokencito}--------------------"); 

    var headerList = <String, String>{};

    // Set Http Request Headers

    headerList['Authorization'] = tokencito;
 
    
    http.Response res = await http.get(
      postUrl,
      headers: headerList
    );

// print("-==-=-=-=-=-=-------${res.statusCode}--------------------"); 
    if ( res.statusCode == 200 ) {
      print("=============DANCING============");
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = 
        body.map((dynamic item) => Post.fromJson(item)).toList();

      return posts;

    }else {
      print("=============DARK============");
      throw "cant get posts";
    }
  }


}