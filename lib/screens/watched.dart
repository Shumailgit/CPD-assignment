import 'dart:convert';

import 'package:assignment/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchedScreen extends StatefulWidget {
  @override
  _WatchedScreenState createState() => _WatchedScreenState();
}

class _WatchedScreenState extends State<WatchedScreen> {
  late SharedPreferences _prefs;
  List<Movie> _watchedMovies = [];

  @override
  void initState() {
    super.initState();
      _loadMovies();
  }

  Future<List<Movie>> _getWatchedMovies() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final watchedData = prefs.getString('watched');
  if (watchedData != null) {
    final List<dynamic> watchedJson = jsonDecode(watchedData);
    return watchedJson.map((e) => Movie.fromJson(e)).toList();
  }
  return [];
}
Future<void> _loadMovies() async {
  final watchedMovies = await _getWatchedMovies();
  setState(() {
    _watchedMovies = watchedMovies;
   
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watched Movies'),
      ),
      body: ListView.builder(
        itemCount: _watchedMovies.length,
        itemBuilder: (context, index) {
          final movie = _watchedMovies[index];
          return ListTile(
            title: Text(movie.title),
            subtitle: Text('Release Date: ${movie.releaseDate}'),
            leading: Image.network(movie.posterPath),
            
          );
        },
      ),
    );
  }
}