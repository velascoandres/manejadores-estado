import 'package:flutter/material.dart';
import 'package:singleton/models/usuario_model.dart';
import 'package:singleton/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioSteam,
        builder: (BuildContext context, AsyncSnapshot<UsuarioModel> snapshot) {
          return snapshot.hasData
              ? Container(
                  child: InformacionUsuario(
                    usuario: snapshot.data,
                  ),
                )
              : Center(
                  child: Text('No hay informacion del usuario'),
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
  final UsuarioModel usuario;

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
          ListTile(
            title: Text('Profesion 1: ${usuario.profesiones[0]}'),
          ),
          ListTile(
            title: Text('Profesion 2: ${usuario.profesiones[1]}'),
          ),
        ],
      ),
    );
  }
}
