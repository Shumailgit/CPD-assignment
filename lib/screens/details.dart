import 'dart:convert';

import 'package:assignment/api/constants.dart';
import 'package:assignment/models/Movie.dart';

import 'package:assignment/movielist/trending.dart';
import 'package:assignment/screens/watched.dart';
import 'package:assignment/screens/watchlist.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DetailsScreen extends StatelessWidget{
const DetailsScreen( {
  Key?key,
  
  required this.movie, 
  
  }):super(key:key);
  final Movie movie;
  
@override
Widget build(BuildContext context){
  return  Scaffold(
    body:CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(top: 18,left: 18),
            decoration:BoxDecoration(color: Colors.green,
            borderRadius: BorderRadius.circular(8)
            ),
            child:IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            )
            
          ),
          backgroundColor: Colors.blue,
          expandedHeight: 500,
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              movie.title,
            style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ), 
            ),
            background: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              child: Image.network(
                '${Constant.imagePath}${movie.posterPath}',
                filterQuality:FilterQuality.high ,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding:const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Overview',
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  movie.overview,
                   style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),

                      ),
                      child: Row(children: [
                        Text(
                          'Release Date: ',
                          style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                    ),
                        ),
                        Text(
                        movie.releaseDate,
                        style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                  ),
                        ),
                      ],

                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                           Text(
                          'Rating: ',
                          style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                    ),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '${movie.voteAverage.toStringAsFixed(1)}/10',
                             style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                    ),
                          
                        ),
                        ],
                      ),
                    ),
                    IconButton( 
                      icon: Icon(Icons.bookmark),
                      tooltip: "add to watchlist",
                      color: Colors.red,
                      onPressed: () {
                    _addToWatchlist(context, movie);
                  
                        
                
                      },

                      ),
                      IconButton(
                         icon: Icon(Icons.check),
                          onPressed: () {
                       _addToWatched(context, movie);
                    

                
                      },
                         )
                  ],

                  ),
                )
              ],
            ),
          ),
        )
      ],
    )
    );
  

}
}
Future<void> _addToWatchlist(BuildContext context,Movie movie) async {
  try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> watchlistMovies = prefs.getStringList('watchlist') ?? [];
    
     watchlistMovies.add(movie.id.toString());
    print('Added ${movie.title} to watchlist');
    SharedPrefHelper.addToWatchlist(movie);
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Added ${movie.title} to watchlist')),
    );
}catch(e){
   print('Error adding ${movie.title} to watchlist: $e');
   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error adding ${movie.title} to watchlist')),
    );
}
  }

  Future<void> _addToWatched(BuildContext context,Movie movie) async {
    try{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> watchedMovies = prefs.getStringList('watched') ?? [];
     watchedMovies.add(movie.id.toString()); 
   
     SharedPrefHelper.addToWatched(movie);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${movie.title} to watched')),
    );
  }catch(e){
     print('Error adding ${movie.title} to watched: $e');
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error adding ${movie.title} to watched')),
    );
  }
  }