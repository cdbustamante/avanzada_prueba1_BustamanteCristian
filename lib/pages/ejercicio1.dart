import 'package:flutter/material.dart';

class Ejercicio1Screen extends StatefulWidget {
  @override
  _Ejercicio1ScreenState createState() => _Ejercicio1ScreenState();
}

class _Ejercicio1ScreenState extends State<Ejercicio1Screen> {
  String _selectedOption = 'radio';
  final TextEditingController _controller = TextEditingController();
  String _result = '';

  void _calculateCircumference() {
    final input = double.tryParse(_controller.text);
    if (input == null || input <= 0) {
      setState(() {
        _result = 'Por favor, ingrese un valor válido.';
      });
      return;
    }

    double circumference;
    if (_selectedOption == 'radio') {
      circumference = 2 * 3.1416 * input;
    } else {
      circumference = 3.1416 * input;
    }

    setState(() {
      _result = 'La longitud de la circunferencia es: $circumference';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Diseñe un algoritmo que calcule y muestre la longitud de una circunferencia. '
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
            ElevatedButton(
              onPressed: _calculateCircumference,
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