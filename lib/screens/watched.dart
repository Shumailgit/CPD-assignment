import 'dart:convert';

import 'package:assignment/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class WatchedScreen extends StatefulWidget {
  @override
  _WatchedScreenState createState() => _WatchedScreenState();
}

class _WatchedScreenState extends State<WatchedScreen> {
  late List<Movie> _watchedMovies;

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final watchedData = prefs.getString('watched');
    List<Movie> watchedMovies = [];
    if (watchedData != null) {
      final List<dynamic> watchedJson = jsonDecode(watchedData);
      watchedMovies = watchedJson.map((e) => Movie.fromJson(e)).toList();
    }
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