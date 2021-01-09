import 'package:bloc_example/bloc/usuario/usuario_events.dart';
import 'package:bloc_example/models/usuario_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    print(event);

    if (event is ActivarUsuario) {
      yield state.copyWith(
        usuario: event.usuario,
      );
    }

    if (event is CambiarEdad) {
      final edad = event.edad;
      final usuario = state.usuario.copyWith(
        edad: edad,
      );
      yield state.copyWith(
        usuario: usuario,
      );
    }


    if (event is AgregarProfesion) {
      final profesion = event.profesion;
      final usuario = state.usuario.copyWith(
        profesiones: [
          ...state.usuario.profesiones,
          profesion,
        ],
      );
      yield state.copyWith(
        usuario: usuario,
      );
    }

    if (event is BorrarUsuario){
      yield state.estadoInicial();
    }

  }
}
