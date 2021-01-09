import 'package:bloc_example/bloc/usuario/usuario_bloc.dart';
import 'package:bloc_example/bloc/usuario/usuario_events.dart';
import 'package:bloc_example/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Establecer Usuario',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  usuarioBloc.add(
                    ActivarUsuario(
                      Usuario(
                        edad: 24,
                        nombre: 'Andres1',
                        profesiones: [
                          'FullStack Developer',
                          'Software Engineer',
                        ],
                      ),
                    ),
                  );
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => usuarioBloc.add(
                  CambiarEdad(25),
                ),
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Añadir una profesion',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
