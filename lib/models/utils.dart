import 'package:cloud_firestore/cloud_firestore.dart';

class MovieUtils {
  static Future<void> toggleWatched(String id, bool watched) async {
    final CollectionReference movies =
        FirebaseFirestore.instance.collection('movies');
    await movies.doc(id).update({'watched': watched});
  }
}
