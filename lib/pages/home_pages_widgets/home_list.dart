
import 'package:android/controllers/home_controller.dart';
import 'package:android/models/celular_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'celular',
      builder: (_){
        return ListView.builder(
          itemBuilder: (context, index){
            final Celular celular = _.celular[index]; 
            return ListTile(
              title: Text("${celular.nombre}"),
              subtitle: Text("${celular.precio}"),
              onTap: _.detalle(celular),
            );
          },
          // itemCount: _.celular.length,
          itemCount: _.celular.length ,
        );
      },

    );
  }
}