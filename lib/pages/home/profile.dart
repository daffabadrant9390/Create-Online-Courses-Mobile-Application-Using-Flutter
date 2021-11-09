// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thinker_app/pages/home/certificatePage.dart';
import 'package:thinker_app/pages/home/editProfile.dart';
import 'package:thinker_app/pages/home/transactionPage.dart';
import 'package:thinker_app/pages/home/wishlistPage.dart';
import 'package:thinker_app/theme/theme.dart';

class ProfilePage extends StatefulWidget {
  var emailData;
  var nameData;
  ProfilePage({Key? key, this.emailData, this.nameData}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState(nameData, emailData);
}

class _ProfilePageState extends State<ProfilePage> {
  var nameData;
  var emailData;

  _ProfilePageState(this.nameData, this.emailData);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Text(
          'Profile',
          style: titlePage,
        ),
      );
    }

    Widget profileInfo() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Row(
          children: [
            Image(
                image: AssetImage('assets/images/icon_profile_small.png'),
                width: 100,
                height: 100),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nameData, style: subtitlePage.copyWith(fontSize: 14)),
                SizedBox(
                  height: 4,
                ),
                Text(emailData,
                    style:
                        subtitlePage.copyWith(fontSize: 14, color: darkGrey)),
              ],
            ),
            Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                            emailData: emailData,
                            nameData: nameData,
                          )));
                },
                icon: Icon(
                  Icons.edit,
                  size: 24,
                  color: lightGrey,
                ))
          ],
        ),
      );
    }

    Widget wishlistBtn() {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => WishlistPage()));
        },
        child: Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              color: backgroundColor1, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/icon_wishlist.png'),
                width: 24,
                color: darkGrey,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Wishlist',
                style: subtitlePage,
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/icon_forward.png',
                    width: 12,
                  ))
            ],
          ),
        ),
      );
    }

    Widget certificateBtn() {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CertificatePage()));
        },
        child: Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              color: backgroundColor1, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/icon_certificate.png'),
                width: 30,
                color: darkGrey,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Sertifikat Saya',
                style: subtitlePage,
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/icon_forward.png',
                    width: 12,
                  ))
            ],
          ),
        ),
      );
    }

    Widget transactionBtn() {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => TransactionPage()));
        },
        child: Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              color: backgroundColor1, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/icon_history.png'),
                width: 30,
                color: darkGrey,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Transaksi Saya',
                style: subtitlePage,
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/icon_forward.png',
                    width: 12,
                  ))
            ],
          ),
        ),
      );
    }

    Widget signOutBtn() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/sign-in-page');
        },
        child: Container(
          margin: EdgeInsets.only(top: defaultMargin),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
              color: backgroundColor1, borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/images/icon_signout.png'),
                width: 30,
                color: darkGrey,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                'Sign out',
                style: subtitlePage,
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/icon_forward.png',
                    width: 12,
                  ))
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            profileInfo(),
            wishlistBtn(),
            certificateBtn(),
            transactionBtn(),
            signOutBtn(),
          ],
        ),
      ),
    );
  }
}
