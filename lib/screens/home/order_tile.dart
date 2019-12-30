import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grub_retriever/models/order.dart';
import 'package:grub_retriever/screens/order_detail_page.dart';

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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OrderDetailPage(
                                order: order,
                              )));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: Colors.brown[300],
                    backgroundImage: AssetImage('assets/coffee_icon.png'),
                  ),
                  title: Text(
                    order.name ?? "Name",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w900),
                  ),
                  subtitle: Text(' ${order.valueMealNumber} value Meal Number'),
                  trailing: Icon(FontAwesomeIcons.candyCane),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
