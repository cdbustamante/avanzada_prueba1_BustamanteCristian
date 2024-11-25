import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio3Screen extends StatefulWidget {
  @override
  _Ejercicio3ScreenState createState() => _Ejercicio3ScreenState();
}

class _Ejercicio3ScreenState extends State<Ejercicio3Screen> {
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = '';

  void _calculateHypotenuse() {
    final base = double.tryParse(_baseController.text);
    final height = double.tryParse(_heightController.text);
    if (base == null || base <= 0 || height == null || height <= 0) {
      setState(() {
        _result = 'Por favor, ingrese valores válidos.';
      });
      return;
    }

    double hypotenuse = sqrt(pow(base, 2) + pow(height, 2));

    setState(() {
      _result = 'La longitud de la hipotenusa es: $hypotenuse';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Diseñe un algoritmo que calcule y muestre la longitud de la hipotenusa de un triángulo rectángulo. '
                  'El algoritmo debe considerar las validaciones de datos que sean necesarias.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _baseController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese la base',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _heightController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingrese la altura',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            ElevatedButton(
              onPressed: _calculateHypotenuse,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              _result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Regresar al Menú'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}