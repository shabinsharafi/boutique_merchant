import 'package:boutique_merchant/ui/authScreen/numeric_pad.dart';
import 'package:boutique_merchant/ui/authScreen/verifyPhone.dart';
import 'package:boutique_merchant/ui/home/homePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import 'package:boutique_merchant/utilities.dart';

class LoginWithPhone extends StatefulWidget {
  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  String phoneNumber = "";

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (isVisible) {
          setState(() {
            isVisible = false;
          });
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
          title: Text(
            "Continue with phone",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          textTheme: Theme.of(context).textTheme,
        ),
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFF7F7F7),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 130,
                      child: Image.asset('assets/images/holding-phone.png'),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 64),
                      child: Text(
                        "You'll receive a 4 digit code to verify next.",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = true;
                        });
                      },
                      child: Container(
                        width: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            phoneNumber == ""
                                ? Text(
                                    "Enter phone number",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    phoneNumber,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: "+91" + phoneNumber,
                              timeout: Duration(seconds: 30),
                              verificationCompleted: verificationCompleted,
                              verificationFailed: verificationFailed,
                              codeSent: codeSent,
                              codeAutoRetrievalTimeout: (String verificationId) {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFFFDC3D),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: NumericPad(
                onNumberSelected: (value) {
                  setState(() {
                    if (value != -1) {
                      phoneNumber = phoneNumber + value.toString();
                    } else {
                      phoneNumber =
                          phoneNumber.substring(0, phoneNumber.length - 1);
                    }
                  });
                },
              ),
            ),
          ],
        )),
      ),
    );
  }

  void codeSent(String verificationId, [int? forceResendingToken]) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyPhone(
                  phoneNumber: phoneNumber,
                  verificationId: verificationId,
                )));
  }

  void verificationFailed(FirebaseAuthException error) {
    Utilities.showToast(context, error.message!);
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential result;
    try {
      result = await auth.signInWithCredential(credential);
      print(result);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      // throw e;
      print(e);
      Utilities.showToast(context, e.toString());
    }
  }
}
