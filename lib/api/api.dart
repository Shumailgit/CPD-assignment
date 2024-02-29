import 'dart:convert';


import 'package:assignment/api/constants.dart';
import 'package:assignment/models/Movie.dart';
import 'package:assignment/models/TV.dart';
import 'package:http/http.dart' as http;
class API{
  static const _NewReleasesUrl='https://api.themoviedb.org/3/movie/now_playing?api_key=${Constant.apiKey}';
  static const _topGrossingUrl='https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apiKey}';
  static const _TVUrl='https://api.themoviedb.org/3/tv/airing_today?api_key=${Constant.apiKey}';
  static const _TrendingUrl='https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apiKey}';
  static const _UpcomingUrl='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apiKey}';
  
Future<List<Movie>> getNewRelease() async{
final response= await http.get(Uri.parse(_NewReleasesUrl));
if(response.statusCode==200){
  final DecodedData=json.decode(response.body)["results"] as List;
  return DecodedData.map((movie)=>Movie.fromJson(movie)).toList();
}else{
  throw Exception('Something happened');
}
}
Future<List<Movie>> getTrending() async{
final response= await http.get(Uri.parse(_TrendingUrl));
if(response.statusCode==200){
  final DecodedData=json.decode(response.body)["results"] as List;
  return DecodedData.map((movie)=>Movie.fromJson(movie)).toList();
}else{
  throw Exception('Something happened');
}
}
Future<List<Movie>> getUpcoming() async{
final response= await http.get(Uri.parse(_UpcomingUrl));
if(response.statusCode==200){
  final DecodedData=json.decode(response.body)["results"] as List;
  return DecodedData.map((movie)=>Movie.fromJson(movie)).toList();
}else{
  throw Exception('Something happened');
}
}
Future<List<Movie>> getTopGrossing() async{
final response= await http.get(Uri.parse(_topGrossingUrl));
if(response.statusCode==200){
  final DecodedData=json.decode(response.body)["results"] as List;
  return DecodedData.map((movie)=>Movie.fromJson(movie)).toList();
}else{
  throw Exception('Something happened');
}
}
Future<List<TV>> getTV() async{
final response= await http.get(Uri.parse(_TVUrl));
if(response.statusCode==200){
  final DecodedData=json.decode(response.body)["results"] as List;
  return DecodedData.map((tv)=>TV.fromJson(tv)).toList();
}else{
  throw Exception('Something happened');
}
}
}