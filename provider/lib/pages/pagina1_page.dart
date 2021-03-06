import 'package:flutter/material.dart';
import 'package:provider_example/models/usuario_model.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              usuarioService.removerUsuario();
            },
          )
        ],
      ),
      body: Container(
        child: usuarioService.existeUsuario
            ? InformacionUsuario(
                usuario: usuarioService.usuario,
              )
            : Center(
                child: Text('No existe usuario'),
              ),
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
            ...this._mostrarProfesiones(),
          ],
        ),
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
