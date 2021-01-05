import 'package:singleton/models/usuario_model.dart';

class _UsuarioService {
  UsuarioModel _usuario;

  UsuarioModel get usuario => this._usuario;


  bool get existeUsuario => this._usuario != null;

  void cargarUsuario(UsuarioModel usuario){
    this._usuario = usuario;
  }

  void cambiarEdad(int edad){
    this._usuario.edad = edad;
  }

  void cambiarNombre(String nombre){
    this._usuario.nombre = nombre;
  }

}


final _UsuarioService usuarioService = new _UsuarioService();
