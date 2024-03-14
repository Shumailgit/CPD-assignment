
import 'package:assignment/firebase_options.dart';
import 'package:assignment/screens/homepage.dart';
import 'package:assignment/screens/signin.dart';
import 'package:assignment/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
       return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
             title: Text('Moviez'),
           
          ),
           body: TabBarView(
            children: [
              Login(),
              Signup(),
              Homepage(),
                 

    ],
          ),
        ),
      ),
    );
  }
}        



