import 'package:bookhub/login_page.dart';
import 'package:flutter/material.dart';
import 'cart.dart'; // Import the Cart page

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('SignUp',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Take up only the space needed
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                  hoverColor: Colors.black.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  hoverColor: Colors.black.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  hoverColor: Colors.black.withOpacity(0.2),
                ),
              ),
              SizedBox(height: 24.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Add signup functionality here
                        // After successful signup, navigate to the Login page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
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
                      child: Text('Signup'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
