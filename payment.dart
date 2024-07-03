import 'package:flutter/material.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentPage(),
    );
  }
}

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment Page',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            PaymentSection(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class PaymentSection extends StatefulWidget {
  @override
  _PaymentSectionState createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  final _formKey = GlobalKey<FormState>();

  String _cardHolderName = '';
  String _creditCardNumber = '';
  String _expiryDate = '';
  String _cvv = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Card Holder Name',
              border: OutlineInputBorder(),
              hoverColor: Colors.black.withOpacity(0.2),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter card holder name';
              }
              return null;
            },
            onSaved: (value) => _cardHolderName = value!,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Debit Card Number',
              border: OutlineInputBorder(),
              hoverColor: Colors.black.withOpacity(0.2),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter credit card number';
              }
              return null;
            },
            onSaved: (value) => _creditCardNumber = value!,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Expiry Date (MM/YY)',
              border: OutlineInputBorder(),
              hoverColor: Colors.black.withOpacity(0.2),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter expiry date';
              }
              return null;
            },
            onSaved: (value) => _expiryDate = value!,
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'CVV',
              border: OutlineInputBorder(),
              hoverColor: Colors.black.withOpacity(0.2),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter CVV';
              }
              return null;
            },
            onSaved: (value) => _cvv = value!,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Process payment here
                print('Card Holder Name: $_cardHolderName');
                print('Debit Card Number: $_creditCardNumber');
                print('Expiry Date: $_expiryDate');
                print('CVV: $_cvv');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentCompletionPage()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 16.0),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text('Make Payment'),
          ),
        ],
      ),
    );
  }
}

class PaymentCompletionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Completion',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 100,
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text(
              'Payment Successful!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Your payment has been successfully processed.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the previous page or home screen
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Back to Home'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Navigate to Profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
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
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('View Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
