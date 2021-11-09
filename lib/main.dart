import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thinker_app/pages/home/mainPage.dart';
import 'package:thinker_app/provider/certificateProvider.dart';
import 'package:thinker_app/provider/historyTransactionProvider.dart';
import 'package:thinker_app/provider/myCourseProvider.dart';
import 'package:thinker_app/provider/wishlistProvider.dart';
import 'pages/splashPage.dart';
import 'pages/signInPage.dart';
import 'pages/signUpPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyCourseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryTransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CertificateProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Poppins'),
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in-page': (context) => SignInPage(),
          '/sign-up-page': (context) => SignUpPage(),
          '/home-page': (context) => MainPage()
        },
      ),
    );
  }
}
