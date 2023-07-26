import 'dart:math';

import 'package:boutique_merchant/constants/constants.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/addBoutiqueScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/ShadowWidget.dart';
import 'package:boutique_merchant/widgets/nothing_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../registration/userRegistrationVM.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserDataProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<UserDataProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Styles.color.primaryColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            padding: EdgeInsets.only(
                bottom: Styles.dimens.screenPadding,
                left: Styles.dimens.screenPadding,
                right: Styles.dimens.screenPadding),
            width: Styles.dimens.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(),
                ),
                RichText(
                  text: TextSpan(
                      text: "Hi\n",
                      style: Styles.textStyle.normalTS
                          .copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                          text: provider.user.name,
                          style: Styles.textStyle.headingTS
                              .copyWith(color: Colors.white),
                        )
                      ]),
                ),
              ],
            ),
          ),
          if (provider.user.merchant != null)
            Padding(
              padding: EdgeInsets.all(Styles.dimens.screenPadding),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ShadowWidget(
                            radius: 15,
                            shadowOptions: ShadowOptions(blurRadius: 40),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${Random().nextInt(50)}',
                                        style: Styles.textStyle.bigHeadingTS),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Orders',
                                      style: Styles.textStyle.smallTS,
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ShadowWidget(
                            radius: 15,
                            shadowOptions: ShadowOptions(blurRadius: 40),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '$rupeeSymbol ${Random().nextInt(5000) + 2486}',
                                        style: Styles.textStyle.bigHeadingTS),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Sales',
                                      style: Styles.textStyle.smallTS,
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ShadowWidget(
                            radius: 15,
                            shadowOptions: ShadowOptions(blurRadius: 40),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${Random().nextInt(50)}',
                                        style: Styles.textStyle.bigHeadingTS),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'New\norders',
                                      style: Styles.textStyle.smallTS,
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ShadowWidget(
                            radius: 15,
                            shadowOptions: ShadowOptions(blurRadius: 40),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${Random().nextInt(50)}',
                                        style: Styles.textStyle.bigHeadingTS),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Orders in progress',
                                      style: Styles.textStyle.smallTS,
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ShadowWidget(
                            radius: 15,
                            shadowOptions: ShadowOptions(blurRadius: 40),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${Random().nextInt(50)}',
                                        style: Styles.textStyle.bigHeadingTS),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Orders\ndelivered',
                                      style: Styles.textStyle.smallTS,
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            )
          else
            Expanded(
              child: Nothing(
                "No boutique found",
                title: "Create Boutique",
                onClick: () {
                  NavigationService.changeScreen(AddBoutiqueScreen());
                },
              ),
            ),
        ],
      ),
    );
  }
}
