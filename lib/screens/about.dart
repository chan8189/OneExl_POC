import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> with AutomaticKeepAliveClientMixin<AboutUs>{
  @override
  Widget build(BuildContext context) {
    print('build About Us');
    return Scaffold(
      appBar: AppBar(
        title: Text('About Exl'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            "At EXL, we believe there is always a better way. We look deeper, we find it and make it happen. "
                "Our solutions integrate operations management services, analytics and technology platforms to deliver immediate results and long-termbusiness impact. We work as a strategic partner to help our clients streamline business operations, improvecorporatefinance, manage compliance, better adapt to change, and create new channels for growth.",
            overflow: TextOverflow.ellipsis,
            maxLines: 15,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
