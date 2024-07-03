import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            SizedBox(height: 10),

            // Edit Profile Button
            TextButton(
              onPressed: () {
                // Navigate to edit profile page
              },
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 20),

            // Bio Component
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Bio:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    maxLines: 5, // allow multiple lines of text
                    controller: bioController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'You can edit here to add your own bio.',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Buttons
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to buy a book page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize:
                        Size(double.infinity, 50), // Make the button wider
                  ),
                  child: Text('Buy a Book'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to sell a book page
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize:
                        Size(double.infinity, 50), // Make the button wider
                  ),
                  child: Text('Sell a Book'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Submit profile
                    // You can add your logic here to submit the profile
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    minimumSize:
                        Size(double.infinity, 50), // Make the button wider
                  ),
                  child: Text('Submit Profile'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
