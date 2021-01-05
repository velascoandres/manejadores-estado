import 'package:flutter/material.dart';

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
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () => {},
              ),

              MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Cambiar edad',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () => {},
              ),

              MaterialButton(
                color: Colors.blue,
                child: Text(
                  'Añadir una profesion',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () => {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () => Navigator.popAndPushNamed(context, 'pagina1'),
      ),
    );
  }
}
