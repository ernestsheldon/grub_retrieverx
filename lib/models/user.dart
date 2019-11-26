class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String valueMealNumber;
  final String items;

  final String placeName;

  UserData(
      {this.uid, this.valueMealNumber, this.name, this.placeName, this.items});
}
