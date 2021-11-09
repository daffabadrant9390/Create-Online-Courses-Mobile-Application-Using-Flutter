// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thinker_app/provider/wishlistProvider.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:thinker_app/model/courseModel.dart';

class WishlistCard extends StatelessWidget {
  final Course course;

  WishlistCard(this.course);
  // const WishlistCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);

    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor1, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              course.urlImageSmall,
              width: 80,
            ),
            SizedBox(
              width: 6,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: courseName.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    course.category,
                    style: courseName.copyWith(fontSize: 12, color: darkGrey),
                  ),
                ]),
            SizedBox(
              width: 3,
            ),
            GestureDetector(
                onTap: () {
                  wishlistProvider.setWishlist(course);
                },
                child:
                    Image.asset('assets/images/icon_love_red.png', width: 30))
          ],
        ));
  }
}
