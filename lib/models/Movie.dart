import 'package:flutter/material.dart';

class Movie{
  String title;
  String backDropPath;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;
  int id;
  Movie({
  required this.title,
  required this.backDropPath,
  required this.originalTitle,
  required this.overview,
  required this.posterPath,
  required this.releaseDate,
  required this.voteAverage,
  required this.id,
  
  
});
factory Movie.fromJson(Map<String, dynamic>json){
  return Movie(
    title: json["title"],
    originalTitle:json["original_title"],
    backDropPath: json["backdrop_path"],
    overview: json["overview"],
    posterPath:json["poster_path"],
    releaseDate:json["release_date"],
    voteAverage: json["vote_average"].toDouble(),
    id: json["id"].toInt(),

    
    );
}
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "original_title": originalTitle,
      "backdrop_path": backDropPath,
      "overview": overview,
      "poster_path": posterPath,
      "release_date": releaseDate,
      "vote_average": voteAverage,
      "id": id,
    };
  }
}

