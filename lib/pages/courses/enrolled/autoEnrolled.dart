// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thinker_app/model/courseModel.dart';
import 'package:thinker_app/pages/courses/enrolled/materialCourseTemplate.dart';
import 'package:thinker_app/pages/courses/materials/materialTemplate.dart';
import 'package:thinker_app/provider/certificateProvider.dart';
import 'package:thinker_app/provider/myCourseProvider.dart';
import 'package:thinker_app/theme/theme.dart';

class AutoEnrolled extends StatefulWidget {
  final Course? course;
  AutoEnrolled(this.course);

  @override
  State<AutoEnrolled> createState() => _AutoEnrolledState(course);
}

class _AutoEnrolledState extends State<AutoEnrolled> {
  final Course? course;
  _AutoEnrolledState(this.course);

  @override
  Widget build(BuildContext context) {
    MyCourseProvider myCourseProvider = Provider.of<MyCourseProvider>(context);

    CertificateProvider certificateProvider =
        Provider.of<CertificateProvider>(context);

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
            right: defaultMargin, left: defaultMargin, top: defaultMargin),
        child: Column(children: [
          Text(course!.title, style: titlePage, textAlign: TextAlign.center),
          SizedBox(
            height: 8,
          ),
          Text(
            course!.category,
            style: courseName.copyWith(color: darkGrey, fontSize: 10),
          ),
        ]),
      );
    }

    return Scaffold(
        backgroundColor: Color(0xffFFA693),
        appBar: AppBar(
            backgroundColor: backgroundColor1,
            title: Text('My Course'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    myCourseProvider.setCourse(course);
                    Navigator.pop(context);

                    //*  Snackbar
                    if (!myCourseProvider.isCouseEnrolled(course)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: backgroundColor3,
                          content: Text(
                            'Course telah berhasil di hapus',
                            textAlign: TextAlign.center,
                          )));
                    }
                  },
                  icon: Image.asset(
                    'assets/images/icon_trashcan.png',
                    width: 20,
                  ))
            ]),
        body: Container(
            child: ListView(
          children: [
            imageCourse(),
            description(),
            MaterialCourseTemplate(
              materialTitle: course?.material1Title,
              materialRoute: MaterialTemplate(
                  title: course?.material1Title,
                  courseImageUrl: course?.material1Image,
                  textContentCourse: course?.material1Content),
            ),
            MaterialCourseTemplate(
              materialTitle: course?.material2Title,
              materialRoute: MaterialTemplate(
                title: course?.material2Title,
                courseImageUrl: course?.material2Image,
                textContentCourse: course?.material2Content,
              ),
            ),
            MaterialCourseTemplate(
              materialTitle: course?.material3Title,
              materialRoute: MaterialTemplate(
                  title: course?.material3Title,
                  courseImageUrl: course?.material3Image,
                  textContentCourse: course?.material3Content),
            ),
            Container(
              margin: EdgeInsets.all(defaultMargin),
              height: 50,
              child: TextButton(
                  onPressed: () {
                    certificateProvider.addCertificate(course);
                    print(certificateProvider.certificate.length);

                    if (certificateProvider.isCertificate(course)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: backgroundColor3,
                          content: Text(
                            'Selamat anda telah menyelesaikan course',
                            textAlign: TextAlign.center,
                          )));
                    }
                  },
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: Color(0xff992006)),
                  child: Text(
                    'Selesai Course',
                    style: TextStyle(color: whiteColor),
                  )),
            )
          ],
        )));
  }
}
