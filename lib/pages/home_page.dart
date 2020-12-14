

import 'package:android/controllers/home_controller.dart';
import 'package:android/pages/home_pages_widgets/home_list.dart';
import 'package:android/view/login.dart';
import 'package:android/view/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

    
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
      
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()), 
          (Route<dynamic> route) => false);
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text("No estoy holi"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  sharedPreferences.clear();
                  // sharedPreferences.commit();
                  Navigator.of(context).pushAndRemoveUntil( 
                    MaterialPageRoute(builder: (BuildContext context) => LoginPage()), (Route<dynamic> route) => false);
                },
                child: Text("Salir", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          // body: HomeList()
          body: Center(
            child: Text("homa babosa"),
          )
          // body: Register(),

        );
      },
      
    );
  }
}