import 'package:brew_crew/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  // collection refrence
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var brew = doc.data() as Map<String, dynamic>;

      var newBrew = Brew(
        name: brew['name'] ?? '',
        sugars: brew['sugars'] ?? '0',
        strength: brew['strength'] ?? 0,
      );

      return newBrew;
    }).toList();
  }

  // get brews stream
  Stream<List<Brew>> get brews {
    final lista = brewCollection.snapshots().map(_brewListFromSnapshot);
    return lista;
  }
}
