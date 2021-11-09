// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thinker_app/model/courseModel.dart';
import 'package:thinker_app/pages/courses/enrolled/manualEnrolled.dart';
import 'package:thinker_app/provider/historyTransactionProvider.dart';
import 'package:thinker_app/provider/myCourseProvider.dart';
import 'package:thinker_app/provider/wishlistProvider.dart';
import 'package:thinker_app/theme/theme.dart';

class AutoPreviewCourse extends StatefulWidget {
  // var imageUrl;
  // var titleCourse;
  // var categoryCourse;
  // var textCourse;
  Course? course;

  AutoPreviewCourse(this.course);

  @override
  State<AutoPreviewCourse> createState() => _AutoPreviewCourseState(course);
}

class _AutoPreviewCourseState extends State<AutoPreviewCourse> {
  // var imageUrl;
  // var titleCourse;
  // var categoryCourse;
  // var textCourse;
  Course? course;

  _AutoPreviewCourseState(this.course);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    MyCourseProvider myCourseProvider = Provider.of<MyCourseProvider>(context);
    HistoryTransactionProvider historyTransactionProvider =
        Provider.of<HistoryTransactionProvider>(context);

    Widget imageCourse() {
      return Container(
        // ignore: prefer_const_constructors
        child: Image(
          image: AssetImage(course!.urlImageBig),
          height: 250,
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, top: 20, bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(course!.title, style: titlePage, textAlign: TextAlign.center),
          SizedBox(
            height: 8,
          ),
          Text(
            course!.category,
            style: courseName.copyWith(color: darkGrey, fontSize: 10),
          ),
          SizedBox(height: 14),
          Text(course!.material1Content,
              style: TextStyle(color: lightGrey), textAlign: TextAlign.justify)
        ]),
      );
    }

    Widget btnEnroll() {
      return Container(
          margin: EdgeInsets.only(
              right: defaultMargin, left: defaultMargin, bottom: defaultMargin),
          height: 50,
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              myCourseProvider.setCourse(course);
              // historyTransactionProvider.setTransaction(course);
              historyTransactionProvider.addTransaction(widget.course);

              print(myCourseProvider.isCouseEnrolled(course));

              //*  Snackbar
              if (myCourseProvider.isCouseEnrolled(course)) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: backgroundColor3,
                    content: Text(
                      'Course telah berhasil di enroll',
                      textAlign: TextAlign.center,
                    )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Color(0xffFC3B3B),
                  content: Text(
                    'Course sudah ada di library. Akan dihapus!',
                    textAlign: TextAlign.center,
                  ),
                ));
              }
            },
            style: TextButton.styleFrom(
                backgroundColor: backgroundColor1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text('Enroll Course', style: TextStyle(color: darkGrey)),
          ));
    }

    return Scaffold(
        backgroundColor: Color(0xffFFA693),
        appBar: AppBar(
          backgroundColor: backgroundColor1,
          title: Text('Preview Course'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  wishlistProvider.setWishlist(widget.course);

                  if (wishlistProvider.isWishlist(widget.course)) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: backgroundColor3,
                        content: Text(
                          'Telah ditambahkan ke wishlist',
                          textAlign: TextAlign.center,
                        )));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Telah diremove dari wishlist',
                          textAlign: TextAlign.center,
                        )));
                  }
                },
                icon: Image(
                  image: AssetImage(wishlistProvider.isWishlist(widget.course)
                      ? 'assets/images/icon_love_red.png'
                      : 'assets/images/icon_love_gray.png'),
                ))
          ],
        ),
        body: SafeArea(
          child: Container(
              child: ListView(children: [
            Column(
              children: [imageCourse(), description(), btnEnroll()],
            ),
          ])),
        ));
  }
}
