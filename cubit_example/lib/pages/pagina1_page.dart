import 'package:cubit_example/bloc/usuario/usuario_cubit.dart';
import 'package:cubit_example/models/usuario_model.dart';
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
            icon: Icon(Icons.logout),
            onPressed: (){
              BlocProvider.of<UsuarioCubit>(context).borrarUsuario();
            },
          )
        ],
      ),
      body: BodyScafold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class BodyScafold extends StatelessWidget {
  const BodyScafold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(
              child: Text('No hay informacion del usuario'),
            );

          case UsuarioActivo:
            return InformacionUsuario(
              usuario: (state as UsuarioActivo).usuario,
            );

          default:
            return Center(
              child: Text('Estado no reconocido'),
            );
        }
      },
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
          ...this._mostrarProfesiones(),
        ],
      ),
    );
  }

  List<Widget> _mostrarProfesiones() {
    return this
        .usuario
        .profesiones
        .map((String profesion) => ListTile(title: Text(profesion)))
        .toList();
  }
}
