import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grub_retriever/services/auth.dart';
import 'package:grub_retriever/services/database.dart';
import 'package:grub_retriever/widgets/users_food_list_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamProvider<QuerySnapshot>.value(
        value: DatabaseService().usersFoodPreferences,
        child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Grub Retriever'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
          body: UsersFoodList(),
        ),
      ),
    );
  }
}
