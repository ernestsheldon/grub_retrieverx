import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersFoodList extends StatefulWidget {
  @override
  _UsersFoodListState createState() => _UsersFoodListState();
}

class _UsersFoodListState extends State<UsersFoodList> {
  @override
  Widget build(BuildContext context) {
    final userFoodsList = Provider.of<QuerySnapshot>(context);

    for (var doc in userFoodsList.documents) {
      print(doc.data);
    }

    return Container();
  }
}
