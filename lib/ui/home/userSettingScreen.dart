import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/common/state_screen.dart';
import 'package:boutique_merchant/ui/editBoutiqueScreen.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:boutique_merchant/widgets/SettingButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../provider/userProvider.dart';

class UserSettingScreen extends ScreenWidget {
  UserSettingScreen({Key? key}) : super(key: key);

  @override
  ScreenState<UserSettingScreen> getState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends ScreenState<UserSettingScreen> {
  late UserProvider userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget getWidget(BuildContext context) {
    return Scaffold(body: Consumer<ItemsProvider>(
      builder: (context, provider, child) {
        return Column(
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
                            text: userProvider.user.name,
                            style: Styles.textStyle.headingTS
                                .copyWith(color: Colors.white),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            /*SettingsButton("Address", () {
              NavigationService.changeScreen(AddressListScreen());
            }),*/
            SettingsButton("Edit Boutique", () {
              NavigationService.changeScreen(EditBoutiqueScreen());
            }),
            SettingsButton("Account Settings", () {}),
          ],
        );
      },
    ));
  }
}