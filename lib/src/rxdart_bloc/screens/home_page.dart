import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_bloc/src/rxdart_bloc/bloc_pattern/empleado_bloc.dart';
import 'package:test_bloc/src/rxdart_bloc/models/empleado.dart';

class HomePageRxDart extends StatelessWidget {
  HomePageRxDart({Key key}) : super(key: key);

  final EmpleadoBloc _empleadoBloc = EmpleadoBloc();
  @override
  Widget build(BuildContext context) {
    _empleadoBloc.fetchAllEmpleados();
    return Material(
      child: CupertinoPageScaffold(
        child: Container(
          child: StreamBuilder<List<Empleado>>(
            stream: _empleadoBloc.allEmpleados,
            builder:
                (BuildContext context, AsyncSnapshot<List<Empleado>> snapshot) {
              return ListView.builder(
                itemCount: (snapshot.hasData) ? snapshot.data.length : 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.darkBackgroundGray
                                .withOpacity(.1),
                            offset: Offset(0.0, 5.0),
                            //blurRadius: 8.0
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "${snapshot.data[index].id}.-",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${snapshot.data[index].nombre}",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                "\$ ${snapshot.data[index].salario}",
                                style: TextStyle(fontSize: 15.0),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(CupertinoIcons.up_arrow),
                            color: Colors.green,
                            onPressed: () {
                              _empleadoBloc
                                  .incrementSalario(snapshot.data[index]);
                            },
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(CupertinoIcons.down_arrow),
                            color: Colors.red,
                            onPressed: () {
                              _empleadoBloc
                                  .decrementSalario(snapshot.data[index]);
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
      ),
    );
  }
}
