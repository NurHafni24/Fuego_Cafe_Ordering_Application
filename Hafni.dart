import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; //For url launcher

void main() {
  runApp(const MyPayment());
}

//Variable to store text Total amount of payment
const totalAmount = Padding(
  padding: EdgeInsets.all(5),
  child: Text(
    'Total: $amount',
    style: TextStyle(
      fontWeight: FontWeight.w800,
      letterSpacing: 0.5,
      fontSize: 25,
    ),
  ),
);

//Variable to store text for payment method
const payMethod = Text(
  'Payment Method:',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontFamily: 'Georgia',
    fontSize: 20,
  ),
);

//Variable to store text for cash method page
const cashMethod = Text(
  'Payment Method: Cash',
  textAlign: TextAlign.center,
  style: TextStyle(
    fontWeight: FontWeight.w800,
    letterSpacing: 0.5,
    fontSize: 25,
  ),
);

const int amount = 20; //nanti ganti dengan variable dari asimah
var text = '0'; //Variable to store user input (in text format)
var balance = 0; //Variable to store balance amount

//Payment page class
class MyPayment extends StatelessWidget {
//Check if the url can be launch or else return a message
//async because it used for future page
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const MyPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //To hide 'debug' banner
      title: 'Flutter Project',
      home: buildHomePage('Fuego Cafe Ordering System'),
    );
  }

  Widget buildHomePage(String title) {
    const titleText = Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        'Payment', //Page title
        style: TextStyle(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          fontSize: 30,
        ),
      ),
    );

//Image for payment method 1
    var m1 = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/cash.png',
            width: 60.0,
          ),
        ),
      ],
    );

//Image for payment method 2
    var m2 = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/payhalal.jpg',
            width: 60.0,
          ),
        ),
      ],
    );

//Image for payment method 3
    var m3 = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/paypal.png',
            width: 60.0,
          ),
        ),
      ],
    );

//Image for payment method 4
    var m4 = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/tng.png',
            width: 60.0,
          ),
        ),
      ],
    );

//Button for payment method 1
    final md1 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          m1,
          CashWidget(), //Call  CashWidget function
        ],
      ),
    );

//Button for payment method 2 - Link to new URL
    final md2 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          m2,
          ElevatedButton(
              child: Text('PayHalal'),
              onPressed: () {
                const url = 'https://payhalal.my';
                launchURL(url);
              }),
        ],
      ),
    );

//Button for payment method 3 - Link to new URL
    final md3 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          m3,
          ElevatedButton(
              child: Text('PayPal'),
              onPressed: () {
                const url = 'https://www.paypal.com/my/home';
                launchURL(url);
              }),
        ],
      ),
    );

//Button for payment method 4 - Link to new URL
    final md4 = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          m4,
          ElevatedButton(
              child: Text('TouchNGo'),
              onPressed: () {
                const url = 'https://www.touchngo.com.my';
                launchURL(url);
              }),
        ],
      ),
    );

//Variable to display all previous variables
    final leftColumn = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          titleText,
          totalAmount,
          payMethod,
          md1,
          md2,
          md3,
          md4,
        ],
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false, //To prevent overflow, can scroll
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child:
                    leftColumn, //Putting leftColumn variable in a box in 1 page
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Method for 'Cash' button to route to new page (ScreenCash)
class CashWidget extends StatelessWidget {
  const CashWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text('Cash'),
        onPressed: () {
          Navigator.of(
                  context) //(MaterialPageRoute) Replace screen with new page with transition
              .push(MaterialPageRoute(
                  builder: (context) =>
                      ScreenCash())); //Push method adds a route(new page) to the stack of routes managed by the Navigator.
        });
  }
}

//Creates mutable state for the widget in the widget tree.
//Override to return a newly created instance of their associated State subclass
//Stateful because the widget will change
class ScreenCash extends StatefulWidget {
  @override
  _ScreenCashState createState() => _ScreenCashState();
}

//State is changing
class _ScreenCashState extends State<ScreenCash> {
  final paidController =
      TextEditingController(); //variable to store text controller

//Update changes of text variable after user finish input their answer
  void _setBalance() {
    setState(() {
      text = paidController.text; //storing text using controller
      balance = int.parse(text) -
          amount; //Converting string to integer to calculate the total balance
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Payment'), //Title for new payment page
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 165, 103, 80)),
      body: Center(
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
          child: SingleChildScrollView(
            //incase overflow, can scroll
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                totalAmount,
                cashMethod,
                SizedBox(
                  //Wrap in sized box to adjust width of field text
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      //If enter words, return error since cannot do calculation
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(labelText: 'Total Paid'),
                      controller: paidController,
                    ),
                  ),
                ),

                RaisedButton(
                  onPressed: _setBalance, //update changes on value
                  child: Text('Pay'),
                  elevation: 8,
                ),

                SizedBox(
                  //To have space between 'Pay' button and 'Total paid'
                  height: 20,
                ),

                Text('Total paid: $text\n', //display initial value
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 23)),

                Text('Balance: $balance\n', //display 0 only
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 23)),

                const FinishWidget(), //call FinishWidget method for 'Finish' button
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//Method for 'Finish' button
class FinishWidget extends StatelessWidget {
  const FinishWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        //Display dialog box above current content (Popup)
        context: context,
        builder: (BuildContext context) => AlertDialog(
          //Alert to ask for confirmation
          content: const Text(
              'Payment Success! Print Receipt?'), //Message in dialog box
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      MyPayment())), //nanti call function homepage/menu
              child: const Text(
                  'No'), //If click 'No', will go to home/menu page again
            ),
            TextButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyPayment())),
              child: const Text(
                  'Yes'), //If click 'Yes', will go to home/menu page again
            ),
          ],
        ),
      ),
      child: const Text('Finish'),
    );
  }
}
