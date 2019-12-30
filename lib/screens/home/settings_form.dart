import 'package:flutter/material.dart';
import 'package:grub_retriever/models/user.dart';
import 'package:grub_retriever/services/database.dart';
import 'package:grub_retriever/shared/constants.dart';
import 'package:grub_retriever/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> valueMealNumber = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13'
  ];

  // form values
  String _currentName;
  String _currentValueMealNumber;

  String _placeName;
  String _ownerId;
  String _items;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Text(
                    'Update your Order settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name ?? 'Enter your Name',
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: userData.placeName ?? 'Enter Place name?',
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty
                        ? 'Please enter a  fast food place name'
                        : null,
                    onChanged: (val) => setState(() => _placeName = val),
                  ),
                  SizedBox(height: 10.0),
                  DropdownButtonFormField(
                    value: _currentValueMealNumber ?? userData.valueMealNumber,
                    decoration: textInputDecoration,
                    items: valueMealNumber.map((number) {
                      return DropdownMenuItem(
                        value: number ?? '0',
                        child: Text('$number Value Meal Number'),
                      );
                    }).toList(),
                    onChanged: (val) =>
                        setState(() => _currentValueMealNumber = val),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: userData.items,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty
                        ? 'Please enter fast food  order items'
                        : null,
                    onChanged: (val) => setState(() => _items = val),
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentValueMealNumber ??
                                  snapshot.data.valueMealNumber,
                              _currentName ?? snapshot.data.name,
                              _placeName ?? snapshot.data.placeName,
                              _ownerId ?? snapshot.data.uid,
                              _items ?? snapshot.data.items);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
