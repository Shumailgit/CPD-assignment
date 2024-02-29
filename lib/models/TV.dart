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
    originalName: json["original_name"] ?? "", // Provide default value if null
    backDropPath: json["backdrop_path"] ?? "", // Provide default value if null
    overview: json["overview"] ?? "", // Provide default value if null
    posterPath: json["poster_path"] ?? "", // Provide default value if null
    date: json["first_air_date"] ?? "", // Provide default value if null
    voteAverage: (json["vote_average"] as double?) ?? 0.0, // Provide default value if null
    name: json["name"] ?? "", // Provide default value if null
  );
}

}