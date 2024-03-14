import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WatchlistScreen extends StatelessWidget {
  final CollectionReference movies =
      FirebaseFirestore.instance.collection('movies');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: StreamBuilder(
        stream: movies.where('watched', isEqualTo: false).snapshots(),
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
                  icon: Icon(Icons.done),
                  onPressed: () => _toggleWatched(movie.id, true),
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

