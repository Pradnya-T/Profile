import 'package:flutter/material.dart';


class TestNotifyScreen extends StatefulWidget {
  @override
  _TestNotifyScreenState createState() => _TestNotifyScreenState();
}

class _TestNotifyScreenState extends State<TestNotifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notifications'),

      ),
      body: Center(
        child: FlatButton(
            onPressed: (){

            },
            child: Text('Show Notification')
        ),
      ),
    );
  }
}
