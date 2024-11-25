import 'package:flutter/material.dart';
import 'pages/ejercicio1.dart';
import 'pages/ejercicio2.dart';
import 'pages/ejercicio3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba de Ejercicios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/ejercicio1': (context) => Ejercicio1Screen(),
        '/ejercicio2': (context) => Ejercicio2Screen(),
        '/ejercicio3': (context) => Ejercicio3Screen(),
      },
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              icon: Icon(Icons.looks_one),
              label: Text('Ejercicio 1'),
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio1');
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.looks_two),
              label: Text('Ejercicio 2'),
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio2');
              },
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.looks_3),
              label: Text('Ejercicio 3'),
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio3');
              },
            ),
            ElevatedButton(
              child: Text('Salir'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmación'),
                      content: Text('¿Estás seguro de que quieres salir?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancelar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Salir'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Lógica para salir de la aplicación
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}