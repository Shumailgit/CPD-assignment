import 'package:assignment/screens/homepage.dart';
import 'package:assignment/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  
  Widget build(BuildContext context) {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController=TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context,usernameController,passwordController),
              
            
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(context) {
    return Column(
      children: [
        Text(
          "Welcome to Moviez",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text("Enter your credentials to login"),
      ],
    );
  }

  Widget _inputField(BuildContext context,TextEditingController usernameController, TextEditingController passwordController) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
              hintText: "Username",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              fillColor: Colors.purple.withOpacity(0.1),
              filled: true,
              prefixIcon: Icon(Icons.person)),
        ),
        SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: Icon(Icons.password),
          ),
          obscureText: true,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async{
            bool authentication=await authenticate(usernameController.text, passwordController.text);
            if(authentication){          
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Homepage(), // Navigate to HomeScreen
              ),
            );
            }else {
              _showErrorMessage(context,'Incorrect username or password');
            }
          
          },
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.purple,
          ),
          child: Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

 

  Widget _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? "),
        TextButton(
          onPressed: () {
             Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Signup(),
              ),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.purple),
          ),
        )
      ],
    );
  }
}
 Future<bool> authenticate(String username, String password) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedUsername = prefs.getString('username');
  String? storedPassword = prefs.getString('password');

  if (storedUsername == username && storedPassword == password) {
    return true; // Authentication successful
  } else {
    return false; // Authentication failed
  }
 }

  void _showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
