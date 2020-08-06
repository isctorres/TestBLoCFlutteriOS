import 'package:test_bloc/src/rxdart_bloc/models/empleado.dart';

class EmpleadosProvider{

  Future<List<Empleado>> empleadosList() async {
    
    List<Empleado> _empleadoList = [
      Empleado(1,'Adrian',15000.0),
      Empleado(2,'Pepe',25000.0),
      Empleado(3,'Alberto',10000.0),
      Empleado(4,'Socorro',8000.0),
      Empleado(5,'Luis',11000.0),
    ];
    return _empleadoList;
  }
}