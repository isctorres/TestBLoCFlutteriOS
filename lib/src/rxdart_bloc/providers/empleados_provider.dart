import 'package:test_bloc/src/rxdart_bloc/models/empleado.dart';

class EmpleadosProvider{
  List<Empleado> _empleadoList = [
    Empleado(1,'Adrian',15000.0),
    Empleado(2,'Pepe',25000.0),
    Empleado(3,'Alberto',10000.0),
    Empleado(4,'Socorro',8000.0),
    Empleado(5,'Luis',11000.0),
  ];

  Future<List<Empleado>> empleadosList() async {
    
    final List<Empleado> empleados = [];
    for (var empleado in _empleadoList) {
      await Future.delayed(Duration(seconds: 2));
      empleados.add(empleado);
    }
    return empleados; 
  }
}