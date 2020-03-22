import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_navigation/sample_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<SampleBloc>(
        create: (_) => SampleBloc(),
        child: BlocBuilder<SampleBloc, Page>(
          builder: (_, page) {
            return AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              child: _getPageWidget(page),
            );
          },
        ),
      ),
    );
  }

  Widget _getPageWidget(Page page) {
    if (page == Page.firstPage) {
      return FirstPage();
    } else if (page == Page.secondPage) {
      return SecondPage();
    }
    return Container();
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 400,
              height: 400,
              color: Colors.red,
              child: Center(
                child: Text(
                  "First Page",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Go to Second Page"),
              onPressed: () => context.bloc<SampleBloc>().add(1),
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 400,
              height: 400,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Second Page",
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Go to First Page"),
              onPressed: () => context.bloc<SampleBloc>().add(0),
            )
          ],
        ),
      ),
    );
  }
}
