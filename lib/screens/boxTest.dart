import 'package:flutter/material.dart';

class boxTest extends StatefulWidget {
  @override
  _boxTestState createState() => _boxTestState();
}

class _boxTestState extends State<boxTest> {
  var _showContainer;
  var _fillColor;

  @override
  void initState() {
    _showContainer = false;
    _fillColor = false;
    super.initState();
  }

  void show() {
    setState(() {
      _showContainer = !_showContainer;
      _fillColor = !_fillColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(
          children: <Widget>[
            Visibility(
              child: SampleContainer(),
              visible: _showContainer,
            ),
            Text(
              "This is a sample text",
              style: TextStyle(fontSize: 40),
            ),
            RaisedButton(
              child: Text("click"),
              onPressed: () {
                debugPrint("clicked");
                show();
              },
            )
          ],
        ),
      )),
    );
  }
}

class SampleContainer extends StatefulWidget {
  @override
  _SampleContainerState createState() => _SampleContainerState();
}

class _SampleContainerState extends State<SampleContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: new BoxDecoration(
        //color: Colors.blueAccent,
        color: Colors.blueAccent,
        border: new Border.all(width: 1.0, color: Colors.blueAccent),
        borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
      ),
    );
  }
}
