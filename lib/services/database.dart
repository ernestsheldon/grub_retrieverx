import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grub_retriever/models/order.dart';
import 'package:grub_retriever/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference orderCollection =
      Firestore.instance.collection('orders');

  Future<void> updateUserData(String valueMealNumber, String name,
      String placeName, String ownerId, String items) async {
    return await orderCollection.document(uid).setData({
      'valueMealNumber': valueMealNumber,
      'name': name,
      'placeName': placeName,
      'ownerId': ownerId,
      'items': items
    });
  }

  // order list from snapshot
  List<Order> _orderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Order(
          name: doc.data['name'] ?? '',
          valueMealNumber: doc.data['valueMealNumber'] ?? '0',
          placeName: doc.data['placeName'] ?? 'fastfood',
          items: doc.data['items'] ?? 'items');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        valueMealNumber: snapshot.data['ValueMealNumber'],
        placeName: snapshot.data['placeName'],
        items: snapshot.data['items']);
  }

  // get brews stream
  Stream<List<Order>> get orders {
    return orderCollection.snapshots().map(_orderListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return orderCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
