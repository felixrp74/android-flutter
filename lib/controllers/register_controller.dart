
import 'dart:convert';

import 'package:android/pages/home_page.dart';
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
 
  // =================EJEMPLO DART
  
  @override
  void onReady(){
    super.onReady();
    print("ON READY REGISTRAR");
   
    // registrar();
    // this.loadCelular();
  }

  Future<http.Response> registrar() async {
      // String nombre = "hey@g";
      // String email = "hey@g";
      // String pass = "hey@g";

    print("$name");
    print("$email");
    print("$password");

    http.Response res = await http.post(
      'http://192.168.0.106:8000/api/register',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
        'password': password
      }),
      
    ); 


    print("=============REGISTRAR JAJAJAS============");

    if ( res.statusCode == 200 ) {
      print("=============DANCING============");
      Get.to(HomePage());

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