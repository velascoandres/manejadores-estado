import 'package:flutter/material.dart';
import 'package:provider_example/models/usuario_model.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${usuarioService.existeUsuario ? usuarioService.usuario.nombre : 'Pagina 2'}'),
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
                  // Si se lo usa dentro de un metodo que no hace un build
                  // usar el listen: false
                  final usuarioService = Provider.of<UsuarioService>(
                    context,
                    listen: false,
                  );
                  usuarioService.usuario = Usuario(
                    nombre: 'Pepe',
                    edad: 23,
                    profesiones: ['', 'Algo'],
                  );
                },
              ),
              MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Cambiar edad',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  final usuarioService = Provider.of<UsuarioService>(
                    context,
                    listen: false,
                  );
                  usuarioService.edad = 29;
                },
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
