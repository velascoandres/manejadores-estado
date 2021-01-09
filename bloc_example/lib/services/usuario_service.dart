import 'dart:async';

import 'package:singleton/models/usuario_model.dart';

class _UsuarioService {
  UsuarioModel _usuario;

  UsuarioModel get usuario => this._usuario;

  StreamController<UsuarioModel> _usuarioStreamController =
      new StreamController<UsuarioModel>.broadcast();

  bool get existeUsuario => this._usuario != null;

  Stream<UsuarioModel> get usuarioSteam => this._usuarioStreamController.stream;

  void cargarUsuario(UsuarioModel usuario) {
    this._usuario = usuario;
    _usuarioStreamController.add(this.usuario);
  }

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    _usuarioStreamController.add(this.usuario);
  }

  void cambiarNombre(String nombre) {
    this._usuario.nombre = nombre;
    _usuarioStreamController.add(this.usuario);
  }

  dispose() {
    this._usuarioStreamController?.close();
  }
}

final _UsuarioService usuarioService = new _UsuarioService();
