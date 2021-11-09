import 'package:flutter/material.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:thinker_app/model/courseModel.dart';

class CertificateCard extends StatelessWidget {
  final Course course;
  CertificateCard(this.course);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff992006), borderRadius: BorderRadius.circular(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          Image(
            image: AssetImage(course.certificateImg),
            height: 100,
          ),
          SizedBox(
            width: 4,
          ),
          Container(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: courseName,
                  ),
                  SizedBox(height: 8),
                  Text(
                    course.category,
                    style: courseName.copyWith(fontSize: 12, color: darkGrey),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
