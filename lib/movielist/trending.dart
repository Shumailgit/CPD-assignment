import 'package:assignment/api/constants.dart';
import 'package:assignment/models/Movie.dart';
import 'package:assignment/screens/details.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefHelper {
  static const String watchedKey = 'watched';
  static const String watchlistKey = 'watchlist';

  // Function to add a movie to the watched list in SharedPreferences
  static Future<void> addToWatched(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> watchedList = prefs.getStringList(watchedKey) ?? [];
    watchedList.add(movie.id.toString()); // Assuming movie id is used as unique identifier
    await prefs.setStringList(watchedKey, watchedList);
  }

  // Function to add a movie to the watchlist in SharedPreferences
  static Future<void> addToWatchlist(Movie movie) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> watchlist = prefs.getStringList(watchlistKey) ?? [];
    watchlist.add(movie.id.toString()); // Assuming movie id is used as unique identifier
    await prefs.setStringList(watchlistKey, watchlist);
  }
}
class NewMoviesSlider extends StatelessWidget {
  const NewMoviesSlider({
    super.key, required this.snapshot,
  });
final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:CarouselSlider.builder(
        itemCount: snapshot.data!.length,
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        viewportFraction: 0.5,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        pageSnapping: true,
      
        autoPlayAnimationDuration: const Duration(seconds: 1),

      ),
      itemBuilder: (context,itemIndex,pageViewIndex){
        
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: 
            (context)=>DetailsScreen(
            movie: snapshot.data[itemIndex],
            ),
            ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
            height: 305,
            width: 200,
            child: Image.network(
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
              '${Constant.imagePath}${snapshot.data[itemIndex].posterPath}'
            ),
            ),
          ),
        );

      },
        
      )
    );
  }
}
void onPressedAddToWatchlist(BuildContext context, Movie movie) {
    SharedPrefHelper.addToWatched(movie);
    SharedPrefHelper.addToWatchlist(movie);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${movie.title} to watchlist and watched')),
    );
  }
