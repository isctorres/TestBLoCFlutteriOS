import 'package:rxdart/rxdart.dart';
import 'package:test_bloc/src/rxdart_bloc/models/empleado.dart';
import 'package:test_bloc/src/rxdart_bloc/repositories/repository.dart';

class EmpleadoBloc{
  List<Empleado> _empleadoList;

  final _repository = Repository();
  final _empleadoFetcher = PublishSubject<List<Empleado>>();
  Stream<List<Empleado>> get allEmpleados => _empleadoFetcher.stream;

  fetchAllEmpleados() async {
    _empleadoList = await _repository.fetchAllEmpleados();
    _empleadoFetcher.sink.add(_empleadoList);
  }

  incrementSalario(Empleado empleado){
    double salarioFinal = empleado.salario * 1.2;
    _empleadoList[empleado.id-1].salario = salarioFinal;
    _empleadoFetcher.sink.add(_empleadoList); 
  }

  decrementSalario(Empleado empleado){
    double salarioFinal = empleado.salario * 0.8;
    _empleadoList[empleado.id-1].salario = salarioFinal;
    _empleadoFetcher.sink.add(_empleadoList); 
  }

  dispose(){
    _empleadoFetcher.close();
  }

}

final bloc = EmpleadoBloc();