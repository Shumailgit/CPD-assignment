import 'package:assignment/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddToWatchlistScreen extends StatelessWidget {
  final Movie movie;

  const AddToWatchlistScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add to Watchlist'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            addToWatchlist(context);
          },
          child: Text('Add ${movie.title} to Watchlist'),
        ),
      ),
    );
  }

  Future<void> addToWatchlist(BuildContext context) async {
    try {
      // Get reference to user's watchlist in Firestore
      final userWatchlistRef = FirebaseFirestore.instance.collection('users').doc('user_id').collection('watchlist');

      // Add movie to user's watchlist
      await userWatchlistRef.doc(movie.id as String?).set({
        'title': movie.title,
        'posterPath': movie.posterPath,
        // Add other movie details as needed
      });

      // Show success message or navigate back to previous screen
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Movie added to watchlist')));
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to add movie to watchlist')));
    }
  }
}
