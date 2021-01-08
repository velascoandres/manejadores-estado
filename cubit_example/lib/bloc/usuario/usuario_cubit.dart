import 'package:cubit_example/models/usuario_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario usuario) {
    emit(UsuarioActivo(usuario: usuario));
  }

  void cambiarEdad(int edad) {
    final estadoActual = state;
    if (estadoActual is UsuarioActivo) {
      final nuevoUsuario = estadoActual.usuario.copyWith(
        edad: edad,
      );
      emit(
        UsuarioActivo(
          usuario: nuevoUsuario,
        ),
      );
    }
  }
}
