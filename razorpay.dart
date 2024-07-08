import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RazorPayPage extends StatefulWidget {
  const RazorPayPage({Key? key}) : super(key: key);

  @override
  _RazorPayPageState createState() => _RazorPayPageState();
}

class _RazorPayPageState extends State<RazorPayPage> {
  late Razorpay _razorpay;
  final TextEditingController amtController = TextEditingController();

  void openCheckout() async {
    if (amtController.text.toString().isEmpty) {
      Fluttertoast.showToast(msg: "Please enter amount to be paid");
      return;
    }
    int amount = int.parse(amtController.text.toString());
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_1DP5mm0lF5G5ag',
      'amount': amount,
      'name': 'Geeks for Geeks',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Succesful ${response.paymentId!}", toastLength: Toast.LENGTH_SHORT);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Fail ${response.message!}", toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "External Wallet ${response.walletName!}", toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image.network('https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200817185016/gfg_company_logo.png',
              width: 300,), // Image.network
            SizedBox(height: 10,),
            Text("Welcome to Razorpay Payment Gateway Integration", style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18
            ),textAlign: TextAlign.center,), // TextStyle, Text
            SizedBox(height: 30,),
            Padding(padding: EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter Amount to be paid',
                  labelStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ), // BorderSide
                  ), // Outline InputBorder
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ), // BorderSide
                  ), // Outline InputBorder
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15)
                ), // InputDecoration
                controller: amtController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Amount to be paid';
                  }
                  return null;
                },
              ), // TextFormField
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: openCheckout, child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Make Payment'),
            ),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
