import 'package:flutter/material.dart';

class mPin extends StatefulWidget {
  @override
  _mPinState createState() => _mPinState();
}

class _mPinState extends State<mPin> {
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new RadioModel(false));
    sampleData.add(new RadioModel(false));
    sampleData.add(new RadioModel(false));
    sampleData.add(new RadioModel(false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Header Section
              Flexible(
                flex: 3,
                child: new Container(
                  height: double.infinity,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(35, 70, 0.0, 0.0),
                  color: Colors.black,
                  child: new ListView.builder(
                    itemCount: sampleData.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return new InkWell(
                        //highlightColor: Colors.red,
                        splashColor: Colors.blueAccent,
                        onTap: () {
                          setState(() {
                            sampleData.forEach(
                                (element) => element.isSelected = false);
                            sampleData[index].isSelected = true;
                          });
                        },
                        child: new RadioItem(sampleData[index]),
                      );
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
//                      Flexible(
//                        flex: 1,
//                        child: new Container(
//                          height: double.infinity,
//                          width: double.infinity,
//                          child: new Row(
//                            crossAxisAlignment: CrossAxisAlignment.start,
//                            children: <Widget>[
//                              Flexible(flex: 1, child: CustomButton("C")),
//                              Flexible(flex: 1, child: CustomButton("+/-")),
//                              Flexible(flex: 1, child: CustomButton("%")),
//                              Flexible(flex: 1, child: CustomButton("\u00F7"))
//                            ],
//                          ),
//                        ),
//                      ),
                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: CustomButton("1")),
                              Flexible(flex: 1, child: CustomButton("2")),
                              Flexible(flex: 1, child: CustomButton("3")),
                              //Flexible(flex: 1, child: CustomButton("X"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: CustomButton("4")),
                              Flexible(flex: 1, child: CustomButton("5")),
                              Flexible(flex: 1, child: CustomButton("6")),
                              //Flexible(flex: 1, child: CustomButton("-"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: CustomButton("7")),
                              Flexible(flex: 1, child: CustomButton("8")),
                              Flexible(flex: 1, child: CustomButton("9")),
                              //Flexible(flex: 1, child: CustomButton("+"))
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: new Container(
                          height: double.infinity,
                          width: double.infinity,
                          child: new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(flex: 1, child: CustomButton("")),
                              Flexible(flex: 1, child: CustomButton("0")),
                              Flexible(
                                  flex: 1,
                                  child: Container(
                                    margin: new EdgeInsets.all(6.0),
                                    height: double.infinity,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(
                                            new Radius.circular(16.0)),
                                        color: Colors.black),
                                    child: new Icon(
                                      Icons.backspace,
                                      color: Colors.white,
                                    ),
                                  )),
                              //Flexible(flex: 1, child: CustomButton("+"))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  String text;

  CustomButton(this.text);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(6.0),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
          color: Colors.black),
      child: new Text(
        text,
        style: new TextStyle(color: Colors.white, fontSize: 26.0),
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 50.0,
            decoration: new BoxDecoration(
              color: _item.isSelected ? Colors.blueAccent : Colors.transparent,
              border: new Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Colors.blueAccent : Colors.grey),
              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
            ),
          ),
//          new Container(
//            margin: new EdgeInsets.only(left: 10.0),
//            child: new Text(_item.text),
//          )
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;

  RadioModel(this.isSelected);
}
