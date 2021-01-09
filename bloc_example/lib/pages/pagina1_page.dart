import 'package:bloc_example/bloc/usuario/usuario_bloc.dart';
import 'package:bloc_example/bloc/usuario/usuario_events.dart';
import 'package:bloc_example/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              BlocProvider
              .of<UsuarioBloc>(context)
              .add(BorrarUsuario());
            },
          ),
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (context, state) {
          if (state.existeUsuario) {
            return InformacionUsuario(
              usuario: state.usuario,
            );
          }
          return Center(
            child: Text('No existe usuario'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  InformacionUsuario({this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Nombre: ${usuario.nombre}'),
            ),
            ListTile(
              title: Text('Edad: ${usuario.edad}'),
            ),
            Divider(),
            Text(
              'Profesiones',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            ...usuario.profesiones
                .map(
                  (profesion) => ListTile(
                    title: Text(profesion),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
