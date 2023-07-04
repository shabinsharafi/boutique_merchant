import 'package:boutique_merchant/styles/dimens.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/provider/authVM.dart';
import 'package:boutique_merchant/ui/home/homeScreen.dart';
import 'package:boutique_merchant/ui/itemsScreen.dart';
import 'package:boutique_merchant/ui/ordersScreen.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:boutique_merchant/utilities.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/imageAsset.dart';
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
    return Consumer<UserDataProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: Stack(
          children: [
            // DrawerScreen(),
            childrens[current],
            provider.user.merchant != null
                ? Positioned(
                    bottom: 0,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/bot_nav.png",
                          width: Styles.dimens.width,
                        ),
                        Positioned(
                          bottom: 9,
                          child: Container(
                            decoration: BoxDecoration(

                                /*color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 7,
                                      spreadRadius: 1,
                                      offset: Offset(1, 1))
                                ],
                                borderRadius:
                                    BorderRadius.vertical(top: Radius.circular(12))*/
                                ),
                            child: Row(
                              children: [
                                NavItem("Home", Utilities.asset("ic_home.svg")),
                                NavItem(
                                  "Items",
                                  Utilities.asset("ic_items.png"),
                                  onClick: () {
                                    NavigationService.changeScreen(
                                        ItemsScreen());
                                  },
                                ),
                                Expanded(child: SizedBox()),
                                NavItem(
                                    "Orders", Utilities.asset("ic_orders.png"),
                                  onClick: () {
                                    NavigationService.changeScreen(
                                        OrdersScreen());
                                  },),
                                NavItem("User", Utilities.asset("ic_user.svg")),
                              ],
                            ),
                            width: Styles.dimens.width,
                          ),
                        ),
                      ],
                    ))
                : SizedBox(),
          ],
        ),
      );
    });
  }
}

class NavItem extends StatelessWidget {
  NavItem(this.title, this.icon, {this.onClick, Key? key}) : super(key: key);

  String title;
  String icon;
  VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (onClick != null) onClick!();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ImageAsset(
                icon,
                height: 36,
                width: 36,
              ),
              Styles.spaceHeight5,
              Text(
                title,
                style: Styles.textStyle.smallBoldTS,
              )
            ],
          ),
        ),
      ),
    );
  }
}
