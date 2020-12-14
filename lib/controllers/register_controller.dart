
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterController extends GetxController {
  
  RegisterController({
        this.name,
        this.email,
        this.password,
    });

  String name;
  String email;
  String password;


  // here we go 
  String urlRegistrar = "http://192.168.0.103:8000/api/register";

   
  void  registrar(String name, String email, String password) async {
   
    // sharedPreferences = await SharedPreferences.getInstance();
    // String tokencito = "Bearer "+sharedPreferences.getString("token");
    // print("-==-=-=-=-=-=-------${toke?ncito}--------------------"); 

    var headerList = <String, String>{};

    // JSON
    // QUERY

    // Set Http Request Headers
    headerList['name'] = name;
    headerList['email'] = email;
    headerList['password'] = password;
    
    http.Response res = await http.post(
      urlRegistrar,
      headers: headerList
    );

    // =================EJEMPLO DART
    Future<http.Response> createAlbum(String title) {
      return http.post(
        urlRegistrar,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'email': email,
          'password': password
        }),
      );
    }

    // =======================FIN DART

    // print("-==-=-=-=-=-=-------${res.statusCode}--------------------"); 
    if ( res.statusCode == 200 ) {
      // print("=============DANCING============");
      // List<dynamic> body = jsonDecode(res.body);

      // List<Post> posts = 
      //   body.map((dynamic item) => Post.fromJson(item)).toList();

      // return posts;

    }else {
      print("=============REGISTER============");
      throw "cant register";
    }
  }



  factory RegisterController.fromJson(Map<String, dynamic> json) => RegisterController(
      name: json["name"],
      email: json["email"],
      password: json["password"],
  );

  Map<String, dynamic> toJson() => {
      "name": name,
      "email": email,
      "password": password,
  };

}