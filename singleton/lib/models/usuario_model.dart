import 'package:flutter/foundation.dart';

class UsuarioModel {
  String nombre;
  int edad;
  List<String> profesiones;

  UsuarioModel({
   @required this.nombre,
   @required this.edad,
  this.profesiones,
  }): assert(nombre != null); // Forzar un error
}
