import 'package:flutter/cupertino.dart';
import 'package:test_bloc/src/rxdart_bloc/screens/home_page.dart';
import 'package:test_bloc/src/simple_bloc/screens/home_page.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final Map<int, Widget> children = const <int, Widget>{
    0 : Text('Simple BLoC'),
    1 : Text('RxDart'),
    //2 : Text('flutter_bloc'),
  };

  final Map<int, Widget> bloc_pages = <int, Widget>{
    0 : HomePage(),
    1 : HomePageRxDart(),
    /*2 : Center(
        child: Text('flutter_bloc')
    )*/
  };

  int currentSegment = 0;

  void onValueChanged(int newValue){
    setState(() {
      currentSegment = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('BLoC Pattern'),
      ),
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 15.0), 
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(16.0)),
              SizedBox(
                width: 500,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CupertinoSlidingSegmentedControl(
                    children: children,
                    onValueChanged: onValueChanged,
                    groupValue: currentSegment,
                  ),
                ),
              ),
              Expanded(
                child: bloc_pages[currentSegment]
              )
            ],
          )
        )
      ),
    );
  }
}