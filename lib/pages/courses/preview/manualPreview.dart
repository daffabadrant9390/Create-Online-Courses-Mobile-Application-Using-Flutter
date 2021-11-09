// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/pages/courses/enrolled/manualEnrolled.dart';
import 'package:thinker_app/theme/theme.dart';

class ManualPreviewCourse extends StatelessWidget {
  const ManualPreviewCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageCourse() {
      return Container(
        // ignore: prefer_const_constructors
        child: Image(
          image: AssetImage('assets/images/web1_big.png'),
          height: 250,
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(children: [
          Text(
            'Fundamental HTML',
            style: titlePage,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Web Development',
            style: courseName.copyWith(color: darkGrey, fontSize: 10),
          ),
          SizedBox(height: 14),
          Text(
              'HTML adalah singkatan dari Hypertext Markup Language, yaitu bahasa markup standar untuk membuat dan menyusun halaman dan aplikasi web.  HTML dibuat oleh Tim Berners-Lee, seorang ahli fisika di lembaga penelitian CERN yang berlokasi di Swiss. Versi pertamanya dirilis pada tahun 1991, dengan 18 tag.',
              style: TextStyle(color: lightGrey),
              textAlign: TextAlign.justify)
        ]),
      );
    }

    Widget btnEnroll() {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          height: 50,
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ManualEnrolledPage()));
            },
            style: TextButton.styleFrom(
                backgroundColor: backgroundColor1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text('Enroll Course', style: TextStyle(color: darkGrey)),
          ));
    }

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: backgroundColor1,
          title: Text('Preview Course'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite, color: darkGrey))
          ],
        ),
        body: SafeArea(
          child: Container(
              child: Column(
            children: [imageCourse(), description(), btnEnroll()],
          )),
        ));
  }
}
