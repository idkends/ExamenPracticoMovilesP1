import 'package:flutter/material.dart';
import '../model/empleado_model.dart';

class EmpleadoViewModel extends ChangeNotifier {
  String desempeno = 'Alto';

  void seleccionarDesempeno(String valor) {
    desempeno = valor;
    notifyListeners();
  }

  //metodos
  EmpleadoModelo calcular(double sueldo, int antiguedad) {
    //variable
    double porcentaje = 0.05;
    if (antiguedad >= 10 && desempeno == 'Alto') {
      porcentaje = 0.20;
    } else if (antiguedad >= 5) {
      porcentaje = 0.10;
    }
    double bono = sueldo * porcentaje;
    double sueldoFinal = sueldo + bono;

    return EmpleadoModelo(
        sueldo: sueldo,
        antiguedad: antiguedad,
        desempeno: desempeno,
        porcentaje: porcentaje,
        bono: bono,
        sueldoFinal: sueldoFinal);
  }
}
