// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/theme/theme.dart';

class MaterialTemplate extends StatelessWidget {
  var title;
  var courseImageUrl;
  var textContentCourse;

  MaterialTemplate(
      {Key? key, this.title, this.courseImageUrl, this.textContentCourse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        child: Text(title, style: titlePage.copyWith(fontSize: 24)),
      );
    }

    Widget imgContent() {
      return Container(
          margin: EdgeInsets.only(top: defaultMargin),
          child: Image(
            image: AssetImage(courseImageUrl),
            width: double.infinity,
          ));
    }

    Widget materialContent() {
      return Container(
          margin: EdgeInsets.only(top: defaultMargin),
          child: Column(
            children: [
              Text(
                textContentCourse,
                style: TextStyle(color: Color(0xff090505), height: 2),
                textAlign: TextAlign.justify,
              ),
            ],
          ));
    }

    return Scaffold(
      backgroundColor: Color(0xffFFA693),
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text('Materi Course'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            margin: EdgeInsets.all(defaultMargin),
            child: ListView(
              children: [header(), imgContent(), materialContent()],
            )),
      ),
    );
  }
}
