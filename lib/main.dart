import 'package:boutique_merchant/provider/ItemsVM.dart';
import 'package:boutique_merchant/provider/addItemProvider.dart';
import 'package:boutique_merchant/provider/authVM.dart';
import 'package:boutique_merchant/provider/boutiqueVM.dart';
import 'package:boutique_merchant/splashScreen.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserDataProvider()),
        ChangeNotifierProvider(create: (context) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (context) => AddItemProvider()),
        ChangeNotifierProvider(create: (context) => BoutiqueProvider()),
        ChangeNotifierProvider(create: (context) => ItemsProvider()),
      ],
      child: MaterialApp(
        title: 'Boutique Merchant',
        color: Colors.white,
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
          fontFamily: 'Quicksand',
          primarySwatch: Styles.color.primaryColor,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
