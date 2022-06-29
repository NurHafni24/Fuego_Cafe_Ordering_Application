import 'package:flutter/material.dart';
import 'package:fuego_cafe/main_menu.dart';
import 'package:url_launcher/url_launcher.dart'; //For url launcher
import 'dart:ui';
import 'package:fuego_cafe/design_utils/constants.dart';

void main() {
  runApp(const MyPayment()); //Accept total price variable
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
    fontSize: 26,
    fontWeight: FontWeight.w700
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

const int amount = 20; //Replace with Asimah's variable (Total amount)
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
    double screenWidth = window.physicalSize.width; //Come from dart:ui class
    return MaterialApp(
      debugShowCheckedModeBanner: false, //To hide 'debug' banner
      title: 'Payment',
      theme: ThemeData(
          primaryColor: white, accentColor: yellow, textTheme: screenWidth < 500 ? TEXT_THEME_SMALL : TEXT_THEME_DEFAULT,fontFamily: "Montserrat"),
      home: buildHomePage('Payment'),
    );
  }

  Widget buildHomePage(String title) {
    
    //Image for payment method 1
    var m1 = Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            'assets/cash2.png',
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
            child: const Text('PayHalal',
              style: TextStyle(
              color: white, fontSize: 15, fontWeight: FontWeight.w500,height: 1.5)
            ),
            onPressed: () {
              const url = 'https://payhalal.my';
              launchURL(url);
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 241, 132, 7),
              padding: EdgeInsets.symmetric(horizontal: 65, vertical: 15),
            ),              
          ),
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
            child: const Text('PayPal',
              style: TextStyle(
              color: white, fontSize: 15, fontWeight: FontWeight.w500,height: 1.5)                
            ),
            onPressed: () {
              const url = 'https://www.paypal.com/my/home';
              launchURL(url);
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 241, 132, 7),
              padding: EdgeInsets.symmetric(horizontal: 72, vertical: 15),
            ),              
          ),
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
            child: Text('TouchNGo',
              style: TextStyle(
              color: white, fontSize: 15, fontWeight: FontWeight.w500,height: 1.5)             
            ),
            onPressed: () {
              const url = 'https://www.touchngo.com.my';
              launchURL(url);
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 241, 132, 7),
              padding: EdgeInsets.symmetric(horizontal: 58, vertical: 15),
            ),              
          ),
        ],
      ),
    );

    //Variable to display all previous variables
    final leftColumn = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
      backgroundColor: Color(0xFFEEEEEE),
      resizeToAvoidBottomInset: false, //To prevent overflow, can scroll
      appBar: AppBar(
        title: Text(title,
          style: const TextStyle(
            color: black, fontWeight: FontWeight.w700, fontSize: 26
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFEEEEEE),
      ),
      
      body: Center(  
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
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
      child: const Text('Cash',
        style: TextStyle(
          color: white, fontSize: 15, fontWeight: FontWeight.w500,height: 1.5)                     
      ),
      onPressed: () {
        Navigator.of(context) //(MaterialPageRoute) Replace screen with new page with transition
          .push(MaterialPageRoute(builder: (context) => ScreenCash())); //Push method adds a route(new page) to the stack of routes managed by the Navigator.
      },
      style: ElevatedButton.styleFrom(
        primary: Color.fromARGB(255, 241, 132, 7),
        padding: EdgeInsets.symmetric(horizontal: 78, vertical: 15),
      ),         
    );
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
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor:Color(0xFFEEEEEE),
      appBar: AppBar(
          title: Text('Payment',
          style: themeData.textTheme.headline1,
          ), //Title for new payment page
          centerTitle: true,
          backgroundColor:Color(0xFFEEEEEE),  
          ),
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
                      decoration: const InputDecoration(labelText: 'Total Paid',
                        labelStyle: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
                      ),
                      ),
                      controller: paidController,
                    ),
                  ),
                ),

                ElevatedButton(
                  onPressed: _setBalance, //update changes on value
                  style:ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 241, 132, 7),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ), 
                  child: const Text('Pay',
                    style: TextStyle(
                        color: white, fontSize: 15, fontWeight: FontWeight.w500,height: 1.5),
                  ),
                ),

                const SizedBox(
                  //To have space between 'Pay' button and 'Total paid'
                  height: 20,
                ),

                Text('Total paid: $text\n', //display initial value
                  style:themeData.textTheme.headline3
                ),

                Text('Balance: $balance\n', //display 0 only
                   style:themeData.textTheme.headline3
                ),

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
      style:ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 241, 132, 7),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ), 
      
      onPressed: () => showDialog<String>(
        //Display dialog box above current content (Popup)
        context: context,
        builder: (BuildContext context) => AlertDialog(
          //Alert to ask for confirmation
          content: const Text(
            'Payment Success! Print Receipt?'), //Message in dialog box
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Menu()
                  )
                ), //nanti call function homepage/menu
                child: const Text('No'), //If click 'No', will go to home/menu page again
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menu())),
                child: const Text('Yes'), //If click 'Yes', will go to home/menu page again
              ),
          ],
        ),
      ),
      child: const Text('Finish',),
    );
  }
}