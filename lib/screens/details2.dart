import 'package:assignment/api/constants.dart';

import 'package:assignment/models/TV.dart';
import 'package:flutter/material.dart';
class DetailsScreen2 extends StatelessWidget{
const DetailsScreen2({
  super.key,
  
  required this.tv
  });
  
  final TV tv;
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
              tv.originalName,
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
                '${Constant.imagePath}${tv.posterPath}',
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
                  tv.overview,
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
                          'Airing date: ',
                          style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                    ),
                        ),
                        Text(
                        tv.date,
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
                          '${tv.voteAverage.toStringAsFixed(1)}/10',
                             style:TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                    ),
                          
                        ),
                        ],
                      ),
                    ),
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