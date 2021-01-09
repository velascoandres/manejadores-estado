

import 'package:bloc_example/models/usuario_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UsuarioEvent{}

class ActivarUsuario extends UsuarioEvent {
  final Usuario usuario;
  ActivarUsuario(this.usuario);
}

