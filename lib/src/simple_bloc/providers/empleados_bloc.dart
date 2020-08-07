import 'dart:async';

import 'package:test_bloc/src/simple_bloc/models/empleado.dart';

class EmpleadoBloc{

  List<Empleado> _empleadoList = [
    Empleado(1,'Rubensin',15000.0),
    Empleado(2,'Edgar',25000.0),
    Empleado(3,'Adrian',10000.0),
    Empleado(4,'Roberto',8000.0),
    Empleado(5,'Luis',11000.0),
  ];

  /*Stream<List<Empleado>> get getEmpleados async*{
    final List<Empleado> empleados = [];
    for (var empleado in _empleadoList) {
      await Future.delayed(Duration(seconds: 2));
      empleados.add(empleado);
      yield empleados;
    }
  }*/


  List<Empleado> empleados;
  final _listaStreamController = StreamController<List<Empleado>>();
  final _counterStreamController = StreamController<int>();

  Stream <List<Empleado>> get listaStream => _listaStreamController.stream;
  StreamSink <List<Empleado>> get listaSink => _listaStreamController.sink;

  Stream <int> get streamnCounter => _counterStreamController.stream;

  EmpleadoBloc(){
    fetchAllEmpleados();
  }

  fetchAllEmpleados() async {
    empleados = await empleadosList();
    _listaStreamController.add(empleados);
    _counterStreamController.add(empleados.length);
  }

  Future<List<Empleado>> empleadosList() async {
    
    final List<Empleado> empleados = [];
    for (var empleado in _empleadoList) {
      await Future.delayed(Duration(seconds: 1));
      empleados.add(empleado);
    }
    return empleados; 
  }

  incrementSalario(Empleado empleado){
    double salarioFinal = empleado.salario * 1.2;
    _empleadoList[empleado.id-1].salario = salarioFinal;
    listaSink.add(_empleadoList); 
  }

  decrementSalario(Empleado empleado){
    double salarioFinal = empleado.salario * 0.8;
    _empleadoList[empleado.id-1].salario = salarioFinal;
    listaSink.add(_empleadoList); 
  }

  void dispose(){
    _listaStreamController.close();
    _counterStreamController.close();
  }
}