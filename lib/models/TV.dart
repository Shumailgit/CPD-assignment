import 'package:flutter/material.dart';

class TV{
  String backDropPath;
  String originalName;
  String date;
  String name;
  String overview;
  String posterPath;
  double voteAverage;
  TV({
  required this.backDropPath,
  required this.originalName,
  required this.overview,
  required this.posterPath,
  required this.date,
  required this.voteAverage,
  required this.name,
  
});
factory TV.fromJson(Map<String, dynamic> json) {
  return TV(
    originalName: json["original_name"] ?? "", 
    backDropPath: json["backdrop_path"] ?? "", 
    overview: json["overview"] ?? "", 
    posterPath: json["poster_path"] ?? "", 
    date: json["first_air_date"] ?? "", 
    voteAverage: (json["vote_average"] as double?) ?? 0.0, 
    name: json["name"] ?? "", 
  );
}

}