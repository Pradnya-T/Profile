import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    razorpay = new Razorpay();

    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key" : "rzp_test_Rn7wuPgBNFd5X9",
      "amount" : num.parse(textEditingController.text)*100,
      "name" : "Sample App",
      "description" : "Maintenance bill",
      "prefill" : {
        "contact" : "1234567890",
        "email" : "usertest@gmail.com"

      },
      "external" : {
        "wallets" : ["Paytm"]

      }
    };
    try{
      razorpay.open(options);

    }catch(e){
      print(e.toString());
    }

  }

  void handlerPaymentSuccess() {
    print("Payment Successful");
    Toast.show("Payment Successful", context);

  }

  void handlerErrorFailure() {
    print("Payment Unsuccessful");
    Toast.show("Payment Unsuccessful", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razor Pay"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Enter the amount "
              ),

            ),

            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.blue,
              child: Text("Pay Now", style: TextStyle(
                color: Colors.white

              ),),
              onPressed: (){
                openCheckout();

              },
            )
          ],
        ),
      ),
    );
  }
}
