import 'package:boutique_merchant/styles/dimens.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:boutique_merchant/widgets/ShadowWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserDataViewModel provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<UserDataViewModel>(context, listen: false);
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
                bottom: Dimens.screenPadding,
                left: Dimens.screenPadding,
                right: Dimens.screenPadding),
            width: Dimens.screenWidth,
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
                      style:
                      Styles.textStyle.textStyleTitle.copyWith(color: Colors.white),
                      children: [
                        TextSpan(
                          text: provider.user.name,
                          style: Styles.textStyle.headingTS.copyWith(color: Colors.white),
                        )
                      ]),
                ),
              ],
            ),
          ),
          provider.user.merchant != null
              ? GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 2,
                  crossAxisSpacing: Dimens.screenPadding,
                  mainAxisSpacing: Dimens.screenPadding,
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.screenPadding,
                      vertical: Dimens.screenPadding),
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
              : Expanded(
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                          text: "No boutique found\n",
                          style: Styles.textStyle.textStyleTitle
                              .copyWith(color: Styles.color.textColor),
                          children: [
                            TextSpan(
                              text: "Create Boutique",
                              recognizer: TapGestureRecognizer()..onTap = () {

                              },
                              style: Styles.textStyle.headingTS
                                  .copyWith(color: Styles.color.primaryColor),
                            )
                          ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
