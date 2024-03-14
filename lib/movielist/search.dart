import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:assignment/api/constants.dart';
import 'package:assignment/screens/details.dart';

class _SearchBarState extends State<SearchBar> {
  List<Map<String, dynamic>> searchResult = [];
  final TextEditingController searchText = TextEditingController();

  Future<List<Map<String, dynamic>>> getSearch(String val) async {
    var _searchUrl =
    
        'https://api.themoviedb.org/3/search/movie?api_key=${Constant.apiKey}&query=$val';
    var searchResponse = await http.get(Uri.parse(_searchUrl));
    if (searchResponse.statusCode == 200) {
      var tempData = jsonDecode(searchResponse.body);
      var searchJson = tempData["results"];
      List<Map<String, dynamic>> results = [];
      for (var item in searchJson) {
        if (item['title'] != null &&
            item['id']!=null&&
            item['poster_path'] != null &&
            item['vote_average'] != null &&
            item['media_type'] != null) {
          results.add({
            'title': item['title'],
            'id':item['title'],
            'poster_path': item['poster_path'],
            'media_type': item['media_type'],
          });
          if (results.length > 20) {
            results.removeRange(20, results.length);
          }
        } else {
          print('Search not found');
        }
          
      }
    
      return results;
    } else {
      throw Exception('Failed to load search results');
    }
     
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10, top: 30, bottom: 20, right: 20),
        child: Column(
          children: [
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                autofocus: false,
                controller: searchText,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchText.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.amber,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.amber,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(232, 255, 255, 255)),
                  border: InputBorder.none,
                ),
                onSubmitted: (val) async {
                  var results = await getSearch(val);
                  setState(() {
                    searchResult = results;
                  });
                },
              ),
            ),
            SizedBox(height: 5),
            if (searchResult.isNotEmpty)
              Container(
                height: 400,
                child: ListView.builder(
                  itemCount: searchResult.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Handle onTap action
                        // For example, navigate to movie details screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              movie: searchResult[index]['id'],
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(searchResult[index]['title']),
                        subtitle: Text(searchResult[index]['media_type']),
                    
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

