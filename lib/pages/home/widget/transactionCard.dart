// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:thinker_app/model/courseModel.dart';

class TransactionCard extends StatelessWidget {
  final Course course;
  TransactionCard(this.course);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 14, right: 14, bottom: 10),
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor1, borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          Image.asset(course.urlImageSmall, width: 100),
          SizedBox(
            width: 12,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              course.title,
              style: courseName.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              course.category,
              style: courseName.copyWith(fontSize: 12, color: darkGrey),
            ),
            SizedBox(
              height: 24,
            ),
            Text('Berhasil',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w500))
          ])
        ]));
  }
}
