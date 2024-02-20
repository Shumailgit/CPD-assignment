


import 'package:assignment/api/api.dart';
import 'package:assignment/models/Movie.dart';
import 'package:assignment/movielist/Lists.dart';
import 'package:assignment/movielist/trending.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';





class Homepage extends StatefulWidget{
  const Homepage({super.key});
  @override
  State<Homepage> createState()=>HomepageState();
}


class HomepageState extends State<Homepage>{
  late Future<List<Movie>>NewRelease;
  late Future<List<Movie>>topGrossing;
  late Future<List<Movie>>TVTonight;
  @override
void initState(){
  super.initState();
  NewRelease=API().getNewRelease();
  topGrossing=API().getTopGrossing();
  TVTonight=API().getTV();

}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 99, 170, 102),
      appBar: AppBar(
      backgroundColor:  const Color.fromARGB(255, 219, 23, 23),

        elevation:0,
        title: Image.asset('web/assets/moviez.jpg',
        fit: BoxFit.cover,
        height: 150,
        filterQuality: FilterQuality.high,
        
        ),
        centerTitle: true,
        
      ),
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child:Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text(
                  "New releases",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    child:FutureBuilder(
                      future: NewRelease,
                      builder:(context, snapshot) {
                        if(snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }else if(snapshot.hasData){
                          return  NewMoviesSlider(snapshot:snapshot,);
                        }else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),

                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Whats in TV tonight",
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                    ),
                  const SizedBox(height: 30),
                  SizedBox(
                    child:FutureBuilder(
                      future: topGrossing,
                      builder:(context, snapshot) {
                        if(snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }else if(snapshot.hasData){
                          return  ListsSlider(snapshot:snapshot,);
                        }else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),

                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Top grossing",
                    style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold
                    ),
                    ),
                  const SizedBox(height: 30),
                  SizedBox(
                    child:FutureBuilder(
                      future: TVTonight,
                      builder:(context, snapshot) {
                        if(snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }else if(snapshot.hasData){
                          return  ListsSlider(snapshot:snapshot,);
                        }else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),

                  ),
                  ],
          ),
  
      ),
    ),
    );
  }
}


  
