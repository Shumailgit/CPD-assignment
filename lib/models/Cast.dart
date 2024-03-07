import 'package:flutter/material.dart';

class Actor{
  String name;
  String department;
  String originalName;
  String profilePath;



  Actor({
  required this.name,
  required this.department,
  required this.originalName,
  required this.profilePath,
 
  
});
factory Actor.fromJson(Map<String, dynamic>json){
  return Actor(
    name: json["name"],
    department:json["department"],
    originalName: json["original_name"],
    profilePath:json["profile_path"],
   
    );
}
}