import 'dart:convert';
import 'package:assignment/screens/details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:assignment/api/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SearchBar extends StatefulWidget{
  const SearchBar({super.key});
  @override
  State<SearchBar>createState()=>_SearchBar();
}
class _SearchBar extends State<SearchBar>{
  List<Map<String,dynamic>>searchResult=[];
  final TextEditingController searchText=TextEditingController();
  bool showList=false;
  var var1;

  Future<void> getSearch(String val) async{
    var _SearchUrl='https://api.themoviedb.org/3/movie/search?api_key=${Constant.apiKey}&query=$val';
    var searchResponse=await http.get(Uri.parse(_SearchUrl));
    if(searchResponse.statusCode==200){
      var tempData=jsonDecode(searchResponse.body);
      var searchJson=tempData["results"];
      for(var item in searchJson){
        if(item['id']!=null &&
        item['poster_path']!=null &&
        item['vote_average']!=null &&
         item['media_type']!=null){
          searchResult.add({
            'id':item['id'],
            'poster_path':item['poster_path'],
             'media_type':item['media_type'],
          });
          if(searchResult.length>20){
            searchResult.removeRange(20, searchResult.length);
          }
        }else{
          print('Search not found');
        }
      }
    }
  }
@override
Widget build(BuildContext context){
  return GestureDetector(
    onTap: () {
      FocusManager.instance.primaryFocus?.unfocus();
      showList=showList;
    },
    child:Padding(
      padding:
      const EdgeInsets.only(left: 10,top: 30,bottom: 20,right: 20),
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
              onSubmitted: (value) {
                searchResult.clear();
                setState(() {
                  var1=value;
                });
              },
              onChanged: (value) {
                searchResult.clear();
                setState(() {
                  var1=value;
                });
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: (){
                    Fluttertoast.showToast(
                      webBgColor: "#000000",
                      webPosition:"center",
                      webShowClose:true,
                      msg: "search cleared",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.black54,
                      textColor: Colors.white,
                      fontSize: 15,

                    );
                    setState(() {
                      searchText.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.amber,

                  ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.amber,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: const Color.fromARGB(232, 255, 255, 255)),
                  border: InputBorder.none,

              ),
            ),
          )
         
        ],
      ),
      )
  );
}
}