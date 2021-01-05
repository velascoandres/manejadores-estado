import 'package:singleton/models/usuario_model.dart';

class _UsuarioService {
  UsuarioModel _usuario;

  UsuarioModel get usuario => this._usuario;


  bool get existeUsuario => this._usuario != null;

  void cargarUsuario(UsuarioModel usuario){
    this._usuario = usuario;
  }

}


final _UsuarioService usuarioService = new _UsuarioService();
