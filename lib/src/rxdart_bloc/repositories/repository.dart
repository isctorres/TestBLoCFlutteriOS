import 'package:test_bloc/src/rxdart_bloc/models/empleado.dart';
import 'package:test_bloc/src/rxdart_bloc/providers/empleados_provider.dart';

class Repository{
  final empleadoProvider = EmpleadosProvider();
  Future<List<Empleado>> fetchAllEmpleados() => empleadoProvider.empleadosList();
}