import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grub_retriever/models/order.dart';
import 'package:grub_retriever/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Order> _userOrderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Order(
          userName: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          foodPlaceName: doc.data['sugars'] ?? '0');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        userName: snapshot.data['name'],
        foodPlaceName: snapshot.data['sugars'],
        strength: snapshot.data['strength']);
  }

  // get brews stream
  Stream<List<Order>> get brews {
    return brewCollection.snapshots().map(_userOrderListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
