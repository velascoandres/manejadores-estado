import 'package:cubit_example/bloc/usuario/usuario_cubit.dart';
import 'package:cubit_example/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key key}) : super(key: key);

  Usuario get usuario => null;

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = BlocProvider.of<UsuarioCubit>(context);

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
                  usuarioCubit.seleccionarUsuario(
                    new Usuario(
                      edad: 23,
                      nombre: 'Pepe',
                      profesiones: ['Abogado', 'Arquitecto'],
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
                onPressed: () => {},
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
