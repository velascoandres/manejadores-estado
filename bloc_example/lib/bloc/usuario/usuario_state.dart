part of 'usuario_bloc.dart';

class UsuarioState {
  final existeUsuario;
  final Usuario usuario;

  UsuarioState({Usuario usuario})
    : usuario = usuario ?? null,
      existeUsuario = (usuario != null ) ? true : false;

   

}
