import 'package:android/controllers/http_service.dart';
import 'package:android/pages/home_page.dart';
import 'package:android/view/login.dart';
import 'package:android/view/post_detail.dart';
import 'package:android/view/register.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart'; 
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:'

import 'models/post_model.dart';

void main() {
  runApp(GetMaterialApp(
    home: HomePage(),
    // home: Register(),
  ));
}

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  SharedPreferences sharedPreferences;
  HttpService httpService = HttpService();
  // Future<List<Post>> postes;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();

      
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      // Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(builder: (BuildContext context) => LoginPage()), 
      //     (Route<dynamic> route) => false);

      // Get.offUntil(
      //   LoginPage(), 
      //   (route) => false
      //   )

      Get.off( LoginPage());
      // Get.to(page)

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
       appBar: AppBar( 
         title: Text("Celular"),
         actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              // sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => LoginPage()), 
                (Route<dynamic> route) => false);

                // Get.offUntil('page', (route) => false)
            },
            child: Text("Salir", style: TextStyle(color: Colors.white)),
          ),
        ],
       ),
       body: FutureBuilder( 
         future: httpService.getPosts(), 
         builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {

           if( snapshot.hasData ) {
            List<Post> posts = snapshot.data;

            return ListView ( 
              children: posts
                .map((Post post) => ListTile( 
                  title: Text(post.nombre), 
                  subtitle: Text(post.precio),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PostDetail(
                        post: post,
                      ),
                    ),
                  ),
                ) )
                .toList(),
            );
           }  
         },
       ),
       
    );
  }
}
