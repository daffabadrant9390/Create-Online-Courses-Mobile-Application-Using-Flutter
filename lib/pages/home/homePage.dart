// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:thinker_app/pages/courses/preview/manualPreview.dart';
import 'package:thinker_app/pages/home/catalog/courseCatalogAll.dart';
import 'package:thinker_app/pages/home/catalog/dataCatalog.dart';
import 'package:thinker_app/pages/home/catalog/designCatalog.dart';
import 'package:thinker_app/pages/home/catalog/webCatalog.dart';
import 'package:thinker_app/theme/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Row(children: [
          Text(
            'Apa yang ingin \nkamu pelajari hari ini?',
            style: titlePage,
          ),
          Spacer(),
          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.notifications, size: 30, color: lightGrey))
        ]),
      );
    }

    Widget popularHeader() {
      return Container(
        margin: EdgeInsets.only(top: 40),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Popular Course',
                  style: subtitlePage,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Minggu ini',
                  style: courseName.copyWith(color: darkGrey, fontSize: 10),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget popularCourse() {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ManualPreviewCourse()));
        },
        child: Container(
          margin: EdgeInsets.only(top: 14),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xff992006),
              borderRadius: BorderRadius.circular(16)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                  image: AssetImage('assets/images/web1_small.png'),
                  width: 120,
                  height: 120),
              SizedBox(
                width: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fundamental HTML5',
                    style: courseName,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Web Development',
                    style: TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w500,
                        fontSize: 10),
                  ),
                  SizedBox(
                    height: 50,
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

    Widget categoryHeader() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: subtitlePage,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'Pilih category coursemu',
                  style: courseName.copyWith(color: darkGrey, fontSize: 10),
                )
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CourseCatalogAll()));
              },
              child: Text(
                'Lihat semua',
                style: courseName.copyWith(fontSize: 10),
              ),
            )
          ],
        ),
      );
    }

    Widget categoryCourses() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DesignCatalogCourse()));
                },
                child: Image(
                  image: AssetImage('assets/images/course_category1.png'),
                  width: 330,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WebCatalogCourse()));
                },
                child: Image(
                  image: AssetImage('assets/images/course_category2.png'),
                  width: 330,
                ),
              ),
              SizedBox(
                width: 16,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DataScienceCatalog()));
                },
                child: Image(
                  image: AssetImage('assets/images/course_category3.png'),
                  width: 330,
                ),
              )
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: ListView(
          children: [
            header(),
            popularHeader(),
            popularCourse(),
            categoryHeader(),
            categoryCourses()
          ],
        ),
      ),
    );
  }
}
