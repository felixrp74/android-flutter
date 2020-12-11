import 'package:flutter/foundation.dart';

class Post {
  final int id;  
  final String nombre;  
  final String precio;

  Post({
    @required this.id, 
    @required this.nombre, 
    @required this.precio
  });
  
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post (
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      precio: json['precio'] as String
    );
  }
}