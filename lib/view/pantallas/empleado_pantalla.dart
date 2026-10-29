import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/empleado_viewmodel.dart';
import '../widgets/option_button.dart';
import '../widgets/campo_numero.dart';

class EmpleadoPantalla extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EmpleadoPantallaState();
}

class _EmpleadoPantallaState extends State<EmpleadoPantalla> {
  //mapeo
  final sueldoController = TextEditingController();
  final antiguedadController = TextEditingController();
  //paso de parametros
  //rutas
  void calcular() {
    double sueldo = double.parse(sueldoController.text);
    int antiguedad = int.parse(antiguedadController.text);

    //recibir a view model
    final vm = context.read<EmpleadoViewModel>();
    final resultado = vm.calcular(sueldo, antiguedad);
    //paso de parametros

    Navigator.pushNamed(context, '/resultado', arguments: resultado);
  }

  @override
  Widget build(BuildContext context) {
    //declarar view model
    final vm = context.watch<EmpleadoViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos del empleado'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CampoNumero(etiqueta: 'Sueldo', controller: sueldoController),
            SizedBox(height: 10),
            CampoNumero(
                etiqueta: 'Antiguedad (anios)',
                controller: antiguedadController),
            SizedBox(height: 10),
            Text('Nivel de desempeno',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            OptionButton(
              titulo: 'Alto',
              valor: 'Alto',
              seleccionado: vm.desempeno,
              onChanged: (valor) => vm.seleccionarDesempeno(valor),
            ),
            OptionButton(
              titulo: 'Medio',
              valor: 'Medio',
              seleccionado: vm.desempeno,
              onChanged: (valor) => vm.seleccionarDesempeno(valor),
            ),
            OptionButton(
              titulo: 'Bajo',
              valor: 'Bajo',
              seleccionado: vm.desempeno,
              onChanged: (valor) => vm.seleccionarDesempeno(valor),
            ),
            ElevatedButton(onPressed: calcular, child: Text('Calcular')),
          ],
        ),
      ),
    );
  }
}
