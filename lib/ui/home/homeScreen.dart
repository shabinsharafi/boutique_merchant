import 'package:boutique_merchant/styles/dimens.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:boutique_merchant/widgets/ShadowWidget.dart';
import 'package:flutter/material.dart';
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
            decoration: BoxDecoration(color: Styles.primaryColor),
            padding: EdgeInsets.only(
                top: 50,
                bottom: Dimens.screenPadding,
                left: Dimens.screenPadding,
                right: Dimens.screenPadding),
            width: Dimens.screenWidth,
            child: Text(
              "Hi ${provider.user.name}",
              style: Styles.textStyleTitle.copyWith(color: Colors.white),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 2,
            crossAxisSpacing: Dimens.screenPadding,
            mainAxisSpacing: Dimens.screenPadding,
            padding: EdgeInsets.symmetric(horizontal: Dimens.screenPadding,vertical: Dimens.screenPadding),
            children: [
              ShadowWidget(
                radius: 15,
                child: Container(
                  decoration: BoxDecoration(
                      color: Styles.primaryColor[100]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    child: Center(child: Text("New Orders")),
                    onTap: () {

                    },
                  ),
                ),
              ),
              ShadowWidget(
                radius: 15,
                child: Container(
                  decoration: BoxDecoration(
                      color: Styles.primaryColor[100]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    child: Center(child: Text("New Orders")),
                    onTap: () {

                    },
                  ),
                ),
              ),
              ShadowWidget(
                radius: 15,
                child: Container(
                  decoration: BoxDecoration(
                      color: Styles.primaryColor[100]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    child: Center(child: Text("New Orders")),
                    onTap: () {

                    },
                  ),
                ),
              ),
              ShadowWidget(
                radius: 15,
                child: Container(
                  decoration: BoxDecoration(
                      color: Styles.primaryColor[100]!.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: InkWell(
                    child: Center(child: Text("New Orders")),
                    onTap: () {

                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
