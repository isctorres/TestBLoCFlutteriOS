import 'package:rxdart/rxdart.dart';
import 'package:test_bloc/src/rxdart_bloc/models/empleado.dart';
import 'package:test_bloc/src/rxdart_bloc/repositories/repository.dart';

class EmpleadoBloc{
  List<Empleado> _empleadoList;

  final _repository = Repository();
  final _empleadoFetcher = PublishSubject<List<Empleado>>();
  final _counterFetcher = PublishSubject<int>();

  Stream<List<Empleado>> get streamEmpleados => _empleadoFetcher.stream;
  Stream<int> get streamCounter => _counterFetcher.stream;

  fetchAllEmpleados() async {
    _empleadoList = await _repository.fetchAllEmpleados();
    _empleadoFetcher.sink.add(_empleadoList);
    _counterFetcher.sink.add(_empleadoList.length);
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
    _counterFetcher.close();
  }

}

final bloc = EmpleadoBloc();