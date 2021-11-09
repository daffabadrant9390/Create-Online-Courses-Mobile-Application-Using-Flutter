// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thinker_app/pages/home/homePage.dart';
import 'package:thinker_app/pages/home/library.dart';
import 'package:thinker_app/pages/home/profile.dart';
import 'package:thinker_app/theme/theme.dart';

class MainPage extends StatefulWidget {
  var nameData;
  var emailData;
  var currentIndex;

  MainPage({Key? key, this.nameData, this.emailData, this.currentIndex})
      : super(key: key);

  @override
  State<MainPage> createState() =>
      _MainPageState(nameData, emailData, currentIndex);
}

class _MainPageState extends State<MainPage> {
  var nameData;
  var emailData;
  int currentIndex = 0;
  _MainPageState(this.nameData, this.emailData, this.currentIndex);

  @override
  Widget build(BuildContext context) {
    Widget bottomNavBar() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          backgroundColor: backgroundColor1,
          currentIndex: currentIndex,
          // * create a function when the item is onTap
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image(
                    image: AssetImage('assets/images/icon_home.png'),
                    width: 34,
                    color: currentIndex == 0 ? whiteColor : btnNonActive,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image(
                    image: AssetImage('assets/images/icon_library.png'),
                    width: 34,
                    color: currentIndex == 1 ? whiteColor : btnNonActive,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Image(
                    image: AssetImage('assets/images/icon_profile_small.png'),
                    width: 34,
                    color: currentIndex == 2 ? whiteColor : btnNonActive,
                  ),
                ),
                label: '')
          ],
        ),
      );
    }

    Widget bodyContent() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return LibraryPage();
        case 2:
          return ProfilePage(
            emailData: emailData,
            nameData: nameData,
          );
        default:
          return HomePage();
      }
    }

    return Scaffold(
        backgroundColor: primaryColor,
        bottomNavigationBar: bottomNavBar(),
        body: bodyContent());
  }
}
