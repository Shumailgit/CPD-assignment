import 'dart:convert';

import 'package:assignment/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WatchlistScreen extends StatefulWidget {
  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  late SharedPreferences _prefs;
  late List<Movie> _watchlistMovies;

  @override
  void initState() {
    super.initState();
    _initializeSharedPreferences();
  }

  Future<void> _initializeSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadWatchlistMovies();
  }

  Future<void> _loadWatchlistMovies() async {
    final watchlistData = _prefs.getString('watchlist');
    List<Movie> watchlistMovies = [];
    if (watchlistData != null) {
      final List<dynamic> watchlistJson = jsonDecode(watchlistData);
      watchlistMovies = watchlistJson.map((e) => Movie.fromJson(e)).toList();
    }
    setState(() {
      _watchlistMovies = watchlistMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watchlist'),
      ),
      body: ListView.builder(
        itemCount: _watchlistMovies.length,
        itemBuilder: (context, index) {
          final movie = _watchlistMovies[index];
          return ListTile(
            leading: Image.network(movie.posterPath),
            title: Text(movie.title),
            trailing: IconButton(
              icon: Icon(Icons.done),
              onPressed: () => _toggleWatched(movie),
            ),
          );
        },
      ),
    );
  }

  Future<void> _toggleWatched(Movie movie) async {
    setState(() {
      _watchlistMovies.removeWhere((element) => element.id == movie.id);
    });
    await _prefs.setString(
        'watchlist', jsonEncode(_watchlistMovies.map((e) => e.toJson()).toList()));
  }
}