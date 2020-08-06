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

  final _listaStreamController = StreamController<List<Empleado>>();
  //final _salarioIncrementStreamController = StreamController<Empleado>();
  //final _salarioDecrementStreamController = StreamController<Empleado>();

  Stream <List<Empleado>> get listaStream => _listaStreamController.stream;
  StreamSink <List<Empleado>> get listaSink => _listaStreamController.sink;

  /*StreamSink <Empleado> get salarioIncrement => _salarioIncrementStreamController.sink;
  StreamSink <Empleado> get salarioDecrement => _salarioDecrementStreamController.sink;*/

  EmpleadoBloc(){
    _listaStreamController.add(_empleadoList);
    //_salarioIncrementStreamController.stream.listen(_incrementSalario);
    //_salarioDecrementStreamController.stream.listen(_decrementSalario);
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
    //_salarioIncrementStreamController.close();
    //_salarioDecrementStreamController.close();

  }
}