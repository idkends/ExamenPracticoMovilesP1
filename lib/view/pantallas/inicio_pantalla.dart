import 'package:flutter/material.dart';

class InicioPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.card_giftcard, size: 100, color: Colors.teal),
            SizedBox(height: 20),
            Text(
              'Bono de empleados',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800),
            ),
            SizedBox(height: 10),
            Text(
              'Calcula el bono mensual segun el sueldo, la antiguedad y el desempeno',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              //rutas
              onPressed: () => Navigator.pushNamed(context, '/empleado'),
              child: Text('Comenzar'),
            ),
          ],
        ),
      ),
    );
  }
}
