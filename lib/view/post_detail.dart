// import 'package:android/post_model.dart';
import 'package:android/models/post_model.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.nombre),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text("Nombre"),
                      subtitle: Text("${post.nombre}"),
                    ),
                    ListTile(
                      title: Text("ID"),
                      subtitle: Text("${post.id}"),
                    ),
                    ListTile(
                      title: Text("Precio"),
                      subtitle: Text("${post.precio}"),
                    ),
                    // ListTile(
                    //   title: Text("User ID"),
                    //   subtitle: Text("${post.userId}"),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
  }
}