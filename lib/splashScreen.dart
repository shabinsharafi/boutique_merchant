import 'dart:async';

import 'package:boutique_merchant/api/api_response.dart';
import 'package:boutique_merchant/ui/authScreen/login.dart';
import 'package:boutique_merchant/ui/home/homePage.dart';
import 'package:boutique_merchant/ui/registration/saveUserDetails.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:boutique_merchant/utils/screen_navigation.dart';
import 'package:provider/provider.dart';


/*import 'api/authApi.dart';
import 'models/loginRequest.dart';
import 'models/socialMediaLogin.dart';*/

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //goToPage();
    init();
  }

  Future<void> login() async {
    /* var email;
    var password;
    await DBProvider.db.getUser().then((user) {
      email = user.email;
      password = user.password;
    });*/
    /* UserApi.getInstance().getDetails().then((response) async {
      if (response.success) {
        Modal.getInstance().setUser(new User(
            name: response.data.userDetails.name,
            email: response.data.userDetails.email,
            phone: response.data.userDetails.phone,
            image: response.data.userDetails.image));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(
                    response.data.userDetails.isVerifiedHost,
                    response.data.userDetails.isAdmin)));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LandingScreen()));
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:ThemeData().primaryColor,
      body: Center(
        child: Container(
          child: Column(children: <Widget>[
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 297.0,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        "Pets Spot",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        "#boutique_merchant",
                        style: TextStyle(
                            color: Color.fromARGB(255, 35, 70, 116),
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 35.0),
                      CircularProgressIndicator(
                        strokeWidth: 1,
                      ),
                    ],
                  ),
                )),
          ]),
        ),
      ),
    );
  }

  Future<void> init() async {
    // Provider.of<UserDataViewModel>(context, listen: false).getPetColors();
    if (FirebaseAuth.instance.currentUser != null) {
      print(FirebaseAuth.instance.currentUser);
      ApiResponse dataResponse =
          await Provider.of<UserDataViewModel>(context, listen: false)
              .getProfile();
      if (!dataResponse.haserror) {
        NavigationService.changeScreenRemoveOther(context, HomePage());
      } else {
        NavigationService.changeScreenRemoveOther(context, SaveUserDetails());
      }
    } else {
      Timer(Duration(seconds: 1), () {
        NavigationService.changeScreenRemoveOther(context, LoginWithPhone());
      });
    }
  }
}
