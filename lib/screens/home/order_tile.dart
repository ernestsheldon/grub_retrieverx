import 'package:flutter/material.dart';
import 'package:grub_retriever/models/order.dart';

class OrderTile extends StatelessWidget {
  final Order brew;

  OrderTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(brew.userName),
          subtitle: Text('Takes ${brew.foodPlaceName} sugar(s)'),
        ),
      ),
    );
  }
}
