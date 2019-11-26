import 'package:flutter/material.dart';
import 'package:grub_retriever/models/order.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  OrderTile({this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: Column(
          children: <Widget>[
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors.brown[300],
                  backgroundImage: AssetImage('assets/coffee_icon.png'),
                ),
                title: Text(order.name),
                subtitle: Text(' ${order.valueMealNumber} value Meal Number'),
              ),
            ),
            Text(
              'Fast food Place ${order.placeName}',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
