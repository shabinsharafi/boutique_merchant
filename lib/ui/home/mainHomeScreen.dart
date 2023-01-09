import 'package:boutique_merchant/styles/dimens.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/authScreen/authVM.dart';
import 'package:boutique_merchant/ui/home/homeScreen.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'drawer_screen.dart';
import 'home_screen.dart';

class MainHomeScreen extends StatefulWidget {
  MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  var childrens = [
    HomeScreen(),
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDataViewModel>(builder: (context, provider, child) {
      return Scaffold(
        body: Stack(
          children: [
            // DrawerScreen(),
            childrens[current],
            provider.user.merchant != null
                ? Positioned(
                    bottom: 0,
                    child: Container(
                      height: 100,
                      width: Styles.dimens.width,
                      color: Colors.black87,
                    ))
                : SizedBox(),
          ],
        ),
      );
    });
  }
}
