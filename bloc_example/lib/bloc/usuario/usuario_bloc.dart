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
      yield UsuarioState(
        usuario: event.usuario,
      );
    }
  }
}
