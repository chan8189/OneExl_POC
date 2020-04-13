import 'package:flutter/material.dart';

class Feedback1 extends StatefulWidget {
  @override
  _Feedback1State createState() => _Feedback1State();
}

class Item {
  const Item(this.name, this.iconUp);

  final String name;

  //final Icon icon;
  final ImageIcon iconUp;
}

class _Feedback1State extends State<Feedback1>
    with AutomaticKeepAliveClientMixin<Feedback1> {
  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
        'eVoyage',
        ImageIcon(
          AssetImage('images/logo.png'),
          size: 50,
        )),
    const Item(
        'OneExl',
        ImageIcon(
          AssetImage('images/logo.png'),
          size: 50,
        )),
    const Item(
        'iExpense',
        ImageIcon(
          AssetImage('images/logo.png'),
          size: 50,
        )),
    const Item(
        'RTP',
        ImageIcon(
          AssetImage('images/logo.png'),
          size: 50,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    print('build About Us');
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0.0, 0.0),
              child: Text(
                "Share your app experiance with us",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.0,
                  wordSpacing: 3.0,
                  fontSize: 16.0,
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: 380.0,
            height: 50.0,
            color: Colors.grey[200],
            margin: EdgeInsets.fromLTRB(10, 0.0, 0.0, 10),
            child: DropdownButton<Item>(
              hint: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Select Application",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              value: selectedUser,
              icon: Icon(Icons.arrow_drop_down),
              elevation: 16,
              isDense: false,
              underline: SizedBox(),
              onChanged: (Item Value) {
                setState(() {
                  selectedUser = Value;
                });
              },
              items: users.map((Item user) {
                return DropdownMenuItem<Item>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      user.iconUp,
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        user.name,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 200)
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
