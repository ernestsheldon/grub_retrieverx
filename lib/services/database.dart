import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //collection reference

  final CollectionReference userFoodPreferenceCollection =
      Firestore.instance.collection('usersFoodPreference');

  Future updateUserData(String fastFoodStore, String userName) async {
    return await userFoodPreferenceCollection
        .document(uid)
        .setData({"fastFoodStore": fastFoodStore, "userName": userName});
  }

  Stream<QuerySnapshot> get usersFoodPreferences {
    return userFoodPreferenceCollection.snapshots();
  }
}
