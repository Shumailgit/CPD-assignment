import 'package:assignment/screens/homepage.dart';
import 'package:assignment/screens/signup.dart';
import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
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

  Widget _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
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
          onPressed: () {
            // Perform login operation
            // If login successful, navigate to HomeScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Homepage(), // Navigate to HomeScreen
              ),
            );
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

  Widget _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Forgot password?",
        style: TextStyle(color: Colors.purple),
      ),
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
