import 'package:bookhub/cart.dart';
import 'package:flutter/material.dart';
import 'sign_up_page.dart'; // Import the Signup page

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0.0, // Remove the app bar shadow
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Take up only the space needed
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(fontSize: 16.0),
                  border: OutlineInputBorder(),
                  hoverColor: Colors.black.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(fontSize: 16.0),
                  border: OutlineInputBorder(),
                  hoverColor: Colors.black.withOpacity(0.2),
                ),
                obscureText: true, // Hide the password input
              ),
              SizedBox(height: 24.0),
              Container(
                width: double.infinity, // Set the width to infinity
                child: ElevatedButton(
                  onPressed: () {
                    // Add login functionality here
                    // After successful login, navigate to the Signup page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: double.infinity, // Set the width to infinity
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the Signup page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('New User? Sign up here'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
