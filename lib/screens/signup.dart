

import 'package:assignment/screens/homepage.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Center(
      child:Card(
        margin: EdgeInsets.all(15.0),
        child:Padding(
          padding: EdgeInsets.all(12.0),
          child:Column(
              mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
               SizedBox(height: 13),
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 13),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child:Text('SignUp'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}