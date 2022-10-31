import 'package:boutique_merchant/splashScreen.dart';
import 'package:boutique_merchant/styles/styles.dart';
import 'package:boutique_merchant/ui/registration/userRegistrationVM.dart';
import 'package:boutique_merchant/utils/NavigationService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDataViewModel>(create:(context)=>UserDataViewModel()),
      ],
      child: MaterialApp(
        title: 'Boutique Merchant',
        navigatorKey: NavigationService.navigatorKey,
        theme: ThemeData(
          primarySwatch: Styles.primaryColor,
        ),
        home:  SplashScreen(),
      ),
    );
  }
}