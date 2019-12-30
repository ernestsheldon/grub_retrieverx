import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grub_retriever/models/order.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;

  OrderDetailPage({this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 455,
                height: 255,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 65.0,
                    backgroundColor: Colors.brown[300],
                    backgroundImage: AssetImage('assets/kittensnowman.jpeg'),
                  ),
                  title: Text(
                    order.name ?? "Name",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(' ${order.valueMealNumber} value Meal Number'),
                  trailing: Icon(
                    FontAwesomeIcons.candyCane,
                    size: 44.0,
                  ),
                ),
              ),
              Text(
                ' ${order.placeName}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Items:  ${order.items}',
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 64.0,
              ),
              FlatButton(
                color: Colors.blueAccent,
                child: Text('Close Window'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
