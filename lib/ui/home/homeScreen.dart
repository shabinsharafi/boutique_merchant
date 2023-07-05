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
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              childAspectRatio: 2,
              crossAxisSpacing: Styles.dimens.screenPadding,
              mainAxisSpacing: Styles.dimens.screenPadding,
              padding: EdgeInsets.symmetric(
                  horizontal: Styles.dimens.screenPadding,
                  vertical: Styles.dimens.screenPadding),
              children: [
                ShadowWidget(
                  radius: 15,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Styles.color.primaryColor[100]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      child: Center(child: Text("New Orders")),
                      onTap: () {},
                    ),
                  ),
                ),
                ShadowWidget(
                  radius: 15,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Styles.color.primaryColor[100]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      child: Center(child: Text("New Orders")),
                      onTap: () {},
                    ),
                  ),
                ),
                ShadowWidget(
                  radius: 15,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Styles.color.primaryColor[100]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      child: Center(child: Text("New Orders")),
                      onTap: () {},
                    ),
                  ),
                ),
                ShadowWidget(
                  radius: 15,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Styles.color.primaryColor[100]!.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: InkWell(
                      child: Center(child: Text("New Orders")),
                      onTap: () {},
                    ),
                  ),
                ),
              ],
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
