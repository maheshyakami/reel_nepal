import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[Text("one"), Expanded(child: Text("two"))],
          ),
          Expanded(
              child: Card(
            child: Column(
              children: <Widget>[
                Expanded(
                    child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  children: <Widget>[
                    Card(
                      child: GridTile(child: Text("one")),
                    ),
                    Card(
                      child: GridTile(child: Text("two")),
                    ),
                    Card(
                      child: GridTile(child: Text("3")),
                    ),
                    Card(
                      child: GridTile(child: Text("4")),
                    ),
                    Card(
                      child: GridTile(
                        child: Text("5"),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
