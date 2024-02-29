// import 'dart:convert';

// import 'package:assignment/api/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class SearchBar extends StatefulWidget{
//   const SearchBar({super.key});
//   @override
//   State<SearchBar>createState()=>_SearchBar();
// }
// class _SearchBar extends State<SearchBar>{
//   List<Map<String,dynamic>>searchResult=[];
//   final TextEditingController searchText=TextEditingController();
//   bool showList=false;
//   var var1;

//   Future<void> getSearch(String val) async{
//     var _SearchUrl='https://api.themoviedb.org/3/movie/search?api_key=${Constant.apiKey}&query=$val';
//     var searchResponse=await http.get(Uri.parse(_SearchUrl));
//     if(searchResponse.statusCode==200){
//       var tempData=jsonDecode(searchResponse.body);
//       var searchJson=tempData["results"];
//       for(var item in searchResponse){
//         if()
//       }
//     }
//   }
// @override
// Widget build(BuildContext context){
// }
// }