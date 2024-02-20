import 'package:assignment/api/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ListsSlider extends StatelessWidget {
  const ListsSlider({
    super.key, required this.snapshot,
  });
final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      width:double.infinity,
      child:CarouselSlider.builder(
        itemCount: snapshot.data!.length,
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        viewportFraction: 0.5,
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        pageSnapping: true,
      
        autoPlayAnimationDuration: const Duration(seconds: 1),

      ),
      itemBuilder: (context,itemIndex,pageViewIndex){
        
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
          height: 305,
          width: 200,
          child:Image.network(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          '${Constant.imagePath}${snapshot.data![itemIndex].posterPath}'

          ),
          ),
        );
      },
        
      )
    );
  }
}