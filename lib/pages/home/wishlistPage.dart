// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/pages/home/widget/wishlistCard.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:thinker_app/pages/courses/preview/smallPreviewCard.dart';
import 'package:thinker_app/provider/wishlistProvider.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    Widget emptyWishlist() {
      return Expanded(
          child: Container(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon_love_red_big.png'),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Belum ada wishlist ditambahkan',
                      style: titlePage.copyWith(fontSize: 16),
                    )
                  ])));
    }

    Widget content() {
      return Expanded(
        child: Container(
          child: ListView(
            children: wishlistProvider.wishlist
                .map((course) => WishlistCard(course))
                .toList(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
          title: Text('Wishlist Courses'),
          centerTitle: true,
          backgroundColor: backgroundColor1),
      body: Container(
          margin: EdgeInsets.only(
              top: defaultMargin,
              right: defaultMargin,
              left: defaultMargin,
              bottom: defaultMargin),
          child: Column(
            children: [
              wishlistProvider.wishlist.length == 0
                  ? emptyWishlist()
                  : content()
            ],
          )),
    );
  }
}
