import 'package:flutter/material.dart';

class Ejercicio2Screen extends StatefulWidget {
  @override
  _Ejercicio2ScreenState createState() => _Ejercicio2ScreenState();
}

class _Ejercicio2ScreenState extends State<Ejercicio2Screen> {
  String _selectedOption = 'radio';
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = '';

  void _calculateCylinder() {
    final input = double.tryParse(_controller.text);
    final height = double.tryParse(_heightController.text);
    if (input == null || input <= 0 || height == null || height <= 0) {
      setState(() {
        _result = 'Por favor, ingrese valores válidos.';
      });
      return;
    }

    double radius = _selectedOption == 'radio' ? input : input / 2;
    double baseArea = 3.1416 * radius * radius;
    double volume = baseArea * height;

    setState(() {
      _result = 'Área basal: $baseArea\nVolumen: $volume';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Diseñe un algoritmo que calcule y muestre el área basal y el volumen de un cilindro. '
                  'El algoritmo debe considerar las validaciones de datos que sean necesarias. '
                  'Realice una implementación que use el radio y otra que use el diámetro.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 'radio',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                Text('Radio'),
                Radio(
                  value: 'diametro',
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                Text('Diámetro'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: _selectedOption == 'radio' ? 'Ingrese el radio' : 'Ingrese el diámetro',
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
              onPressed: _calculateCylinder,
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