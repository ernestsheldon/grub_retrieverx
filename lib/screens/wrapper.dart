import 'package:flutter/material.dart';
import 'package:grub_retriever/models/user.dart';
import 'package:grub_retriever/screens/authenticate/authenticate.dart';
import 'package:grub_retriever/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      //return Home();
      return Home();
    }
  }
}
