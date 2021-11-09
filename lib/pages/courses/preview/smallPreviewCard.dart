// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thinker_app/model/courseModel.dart';
import 'package:thinker_app/pages/courses/enrolled/autoEnrolled.dart';
import 'package:thinker_app/pages/courses/preview/autoPreview.dart';
import 'package:thinker_app/pages/courses/preview/manualPreview.dart';
import 'package:thinker_app/provider/myCourseProvider.dart';
import 'package:thinker_app/theme/theme.dart';

class SmallPreviewCard extends StatelessWidget {
  final Course course;
  SmallPreviewCard(this.course);

  @override
  Widget build(BuildContext context) {
    MyCourseProvider myCourseProvider = Provider.of<MyCourseProvider>(context);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AutoEnrolled(course)));
      },
      child: Container(
        margin: EdgeInsets.only(top: 14),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xff992006), borderRadius: BorderRadius.circular(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
                image: AssetImage(course.urlImageSmall),
                width: 120,
                height: 120),
            SizedBox(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.title,
                  style: courseName,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  course.category,
                  style: TextStyle(
                      color: darkGrey,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ),
                SizedBox(
                  height: 36,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                    ),
                    Image.asset(
                      'assets/images/icon_star.png',
                      width: 31,
                      height: 15,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Image.asset('assets/images/icon_difficulty_easy.png',
                        width: 16, height: 16)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
