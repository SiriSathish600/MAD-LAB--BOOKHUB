import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final _chatCollection = 'chats';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection(_chatCollection).snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data.docs[index];
                    return ListTile(
                      title: Text(document['message']),
                      subtitle: Text(document['username']),
                    );
                  },
                );
              },
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Message',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a message';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        await _firestore.collection(_chatCollection).add({
                          'message': _messageController.text,
                          'username': 'John Doe', // Replace with actual username
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                        _messageController.clear();
                      }
                    },
                    child: Text('Send'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
