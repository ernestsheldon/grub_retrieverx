import 'package:flutter/material.dart';
import 'package:grub_retriever/screens/wrapper.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        width: 450,
        height: 450,
        color: Colors.blueAccent,
        child: Container(
            child: Center(
                child: Column(
          children: <Widget>[
            Text('Profile screen'),
            FlatButton(
              onPressed: () {
                // Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wrapper()));
              },
              child: Text('orders'),
            ),
          ],
        ))),
      ),
    );
  }
}
