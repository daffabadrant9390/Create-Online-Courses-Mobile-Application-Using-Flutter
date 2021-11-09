// ignore_for_file: file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:thinker_app/pages/courses/preview/autoPreview.dart';
import 'package:thinker_app/pages/home/catalog/searchWidget.dart';
import 'getData/design_api.dart';
import 'package:thinker_app/model/courseModel.dart';

class DesignCatalogCourse extends StatefulWidget {
  const DesignCatalogCourse({Key? key}) : super(key: key);

  @override
  State<DesignCatalogCourse> createState() => _DesignCatalogCourseState();
}

class _DesignCatalogCourseState extends State<DesignCatalogCourse> {
  List<Course> courses = [];
  List<Course> allCourses = [];
  Future<List<Course>> getAllCourses() async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/json/course_data.json');
    final body = json.decode(data);
    List selectedItem = body.where((el) => el["category"] == "Design").toList();
    print(selectedItem);

    return selectedItem.map<Course>(Course.fromJson).toList();
  }

  String query = '';
  TextEditingController courseController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    getAllCourses().then((value) {
      setState(() {
        allCourses = value;
        courses = allCourses;
        print('allCourses : $allCourses');
      });
    });

    print('length : ${courses.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: Text('Catalog Design'),
          centerTitle: true,
          backgroundColor: backgroundColor1,
        ),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 14, right: 30, left: 30),
            child: Column(
              children: [
                buildSearch(),
                Expanded(
                  child: ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (context, index) {
                        // final course_choosen = courses.indexWhere(
                        //     (element) => element.isEnrolled == true);
                        final course = courses[index];
                        print('title ${course.title}');

                        // return buildCourse(course);
                        return buildCourse(course);
                      }),
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildSearch() {
    return SearchWidget(
        text: query,
        onChanged: searchCourses,
        hintText: 'Masukkan nama course');
  }

  Widget buildCourse(Course? course) {
    return Container(
        margin: EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AutoPreviewCourse(
                    // imageUrl: course?.urlImageBig,
                    // titleCourse: course?.title,
                    // categoryCourse: course?.category,
                    course)));
          },
          child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: backgroundColor1,
                  borderRadius: BorderRadius.circular(16)),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Image(
                    image: AssetImage(course!.urlImageSmall),
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
                          fontSize: 12),
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
              ])),
        ));
  }

  void searchCourses(String query) {
    final courses = allCourses.where((course) {
      final titleLower = course.title.toLowerCase();
      final categoryLower = course.category.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          categoryLower.contains(searchLower);
    }).toList();

    // print('courses : $courses');

    setState(() {
      this.query = query;
      this.courses = courses;
    });
    // print('courses : $courses');
  }
}
