import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WatchedScreen extends StatelessWidget {
  final CollectionReference movies =
      FirebaseFirestore.instance.collection('movies');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watched Movies'),
      ),
      body: StreamBuilder(
        stream: movies.where('watched', isEqualTo: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final movie = documents[index];
              return ListTile(
                leading: Image.network(movie['posterPath']),
                title: Text(movie['title']),
                trailing: IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => _toggleWatched(movie.id, false),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _toggleWatched(String id, bool watched) async {
    await movies.doc(id).update({'watched': watched});
  }
}
