
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer_screen.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [/*
            DrawerScreen(),
            HomeScreen(),*/
          ],
        ),
      ),
    );
  }
}