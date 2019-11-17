import 'package:flutter/material.dart';
import 'package:grub_retriever/models/order.dart';
import 'package:grub_retriever/screens/home/order_tile.dart';
import 'package:provider/provider.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<order>>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return OrderTile(brew: brews[index]);
      },
    );
  }
}
