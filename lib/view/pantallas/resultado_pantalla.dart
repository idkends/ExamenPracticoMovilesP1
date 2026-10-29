import 'package:flutter/material.dart';
import '../../model/empleado_model.dart';

class ResultadoPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //recibir los parametros
    final empleado =
        ModalRoute.of(context)!.settings.arguments as EmpleadoModelo;
    Widget dato(String titulo, String valor) {
      return ListTile(
        title: Text(titulo),
        trailing: Text(valor),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Card(
            color: Colors.white,
            child: Column(
              children: [
                dato('desempeno', empleado.desempeno),
                dato('sueldo', '\$${empleado.sueldo}'),
                dato('antiguedad', '${empleado.antiguedad}'),
                dato('porcentaje bono', '${empleado.porcentaje * 100}%'),
                dato('valor bono', '\$${empleado.bono}'),
                dato('sueldo final', '\$${empleado.sueldoFinal}'),
              ],
            ),
          ),
          //boton para regresar
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Regresar'),
          ),
        ]),
      ),
    );
  }
}
