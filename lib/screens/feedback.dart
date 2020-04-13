import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
  var _ratingController = TextEditingController();
  double _rating;
  double _userRating = 3.0;
  int _ratingBarMode = 1;
  bool _isRTLMode = false;
  bool _isVertical = false;
  IconData _selectedIcon;

  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
        'None',
        ImageIcon(
          AssetImage('images/evoayge_app_icon.png'),
          size: 50,
        )),
    const Item(
        'eVoyage',
        ImageIcon(
          AssetImage('images/evoayge_app_icon.png'),
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
  void initState() {
    _ratingController.text = "3.0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build About Us');
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () async {
              _selectedIcon = await showDialog<IconData>(
                context: context,
                builder: (context) => IconAlert(),
              );
              _ratingBarMode = 1;
              setState(() {});
            },
          ),
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
                  color: Colors.black45,
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
              isExpanded: true,
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
          SizedBox(height: 20),
          Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0.0, 0.0),
              child: Text(
                "Rate your experiance",
                style: TextStyle(
                  color: Colors.black45,
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
            child: RatingBar(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
                ;
              },
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 20.0, 0.0),
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                //contentPadding: new EdgeInsets.fromLTRB(10, 10, 10.0, 0.0),
                hintText: "Feedback!",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40.0,
            margin: EdgeInsets.fromLTRB(10, 10, 20.0, 0.0),
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: RaisedButton(
              elevation: 0.0,
              //color: new Color.fromRGBO(24, 85, 250, 1),
              child: Text("Submit", style: TextStyle(color: Colors.white70)),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blueGrey)),
              onPressed: () {},
              color: Colors.blue[400],
              textColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class IconAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Select Icon',
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titlePadding: EdgeInsets.all(12.0),
      contentPadding: EdgeInsets.all(0),
      content: Wrap(
        children: [
          _iconButton(context, Icons.home),
          _iconButton(context, Icons.airplanemode_active),
          _iconButton(context, Icons.euro_symbol),
          _iconButton(context, Icons.beach_access),
          _iconButton(context, Icons.attach_money),
          _iconButton(context, Icons.music_note),
          _iconButton(context, Icons.android),
          _iconButton(context, Icons.toys),
          _iconButton(context, Icons.language),
          _iconButton(context, Icons.landscape),
          _iconButton(context, Icons.ac_unit),
          _iconButton(context, Icons.star),
        ],
      ),
    );
  }

  _iconButton(BuildContext context, IconData icon) => IconButton(
        icon: Icon(icon),
        onPressed: () => Navigator.pop(context, icon),
        splashColor: Colors.amberAccent,
        color: Colors.amber,
      );
}
