import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc/src/simple_bloc/models/empleado.dart';
import 'package:test_bloc/src/simple_bloc/providers/empleados_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final EmpleadoBloc _empleadoBloc = EmpleadoBloc();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
       child: Container(
         child: StreamBuilder<List<Empleado>>(
           stream: _empleadoBloc.listaStream,
           builder: (BuildContext context, AsyncSnapshot<List<Empleado>> snapshot){
             return ListView.builder(
               itemCount: (snapshot.hasData) ? snapshot.data.length : 0,
               itemBuilder: (context,index){
                 return Card(
                   elevation: 5.0,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       Container(
                         padding: EdgeInsets.all(20.0),
                         child: Text("${snapshot.data[index].id}.-", style: TextStyle(fontSize: 20.0),),
                       ),
                       Container(
                         padding: EdgeInsets.all(20.0),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                            Text("${snapshot.data[index].nombre}", style: TextStyle(fontSize: 18.0),),
                            Text("\$ ${snapshot.data[index].salario}", style: TextStyle(fontSize: 15.0),)
                           ],
                         ),
                       ),
                       Container(
                         child: IconButton(
                           icon: Icon(Icons.thumb_up),
                           color: Colors.green,
                           onPressed: (){
                             //_empleadoBloc.salarioIncrement.add(snapshot.data[index]);
                             _empleadoBloc.incrementSalario(snapshot.data[index]);
                           },
                         ),
                       ),
                       Container(
                         child: IconButton(
                           icon: Icon(Icons.thumb_down),
                           color: Colors.red,
                           onPressed: (){
                             //_empleadoBloc.salarioDecrement.add(snapshot.data[index]);
                             _empleadoBloc.decrementSalario(snapshot.data[index]);
                           },
                         ),
                       )
                     ],
                   ),
                 );
               },
             );
           },
         ),
       ),
    );
  }

  @override
  void dispose(){
    super.dispose();
  }
} 
