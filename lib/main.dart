import 'package:flutter/material.dart';
import 'score.dart';
import 'haga.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Goal(),
    );
  }
}

class Goal extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Goal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        title: Center(
            child: Text(
          'SCOREBORDER',
          style: TextStyle(color: Colors.white, fontSize: 25),
        )),
      ),
      body: FutureBuilder(
        future: ApiScore()
            .getallmatches(), //Here we will call our getData() method,
        builder: (context, snapshot) {
          //the future builder is very intersting to use when you work with api
          if (snapshot.hasData) {
            print((snapshot.data).length);
            return PageBody(snapshot.data);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }, // here we will buil the app layout
      ),
    );
  }
}
