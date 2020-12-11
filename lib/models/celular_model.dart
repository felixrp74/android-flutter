
import 'package:flutter/foundation.dart';

class Celular {
  final int id;  
  final String nombre;  
  final String precio;

  Celular({
    @required this.id, 
    @required this.nombre, 
    @required this.precio
  });
  
  factory Celular.fromJson(Map<String, dynamic> json) {
    return Celular (
      id: json['id'] as int,
      nombre: json['nombre'] as String,
      precio: json['likert'] as String
    );
  }
}