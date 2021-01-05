import 'package:flutter/material.dart';
import 'package:singleton/models/usuario_model.dart';
import 'package:singleton/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  usuarioService.cargarUsuario(
                    UsuarioModel(
                      edad: 22,
                      nombre: 'Pepe',
                      profesiones: [
                        'Ninguna',
                        'Ninguna x2'
                      ],
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
                onPressed: (){
                  usuarioService.cambiarEdad(25);
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
