import 'package:flutter/foundation.dart';
import 'package:provider_example/models/usuario_model.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => _usuario;
  bool get existeUsuario => this._usuario != null;

  set usuario(Usuario usuario) {
    this._usuario = usuario;
    notifyListeners();
  }

  set edad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void agregarProfesion() {
    final total = this._usuario.profesiones.length + 1;
    this._usuario.profesiones.add( 'Profesion: $total');
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }
}
