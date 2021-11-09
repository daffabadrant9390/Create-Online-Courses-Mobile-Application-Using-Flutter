import 'package:flutter/material.dart';
import 'package:thinker_app/pages/courses/preview/smallPreviewCard.dart';
import 'package:thinker_app/pages/home/catalog/courseCatalogAll.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:thinker_app/provider/myCourseProvider.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  Widget build(BuildContext context) {
    @override
    MyCourseProvider myCourseProvider = Provider.of<MyCourseProvider>(context);

    Widget header() {
      return AppBar(
        title: Text('My Courses'),
        centerTitle: true,
        backgroundColor: backgroundColor1,
        automaticallyImplyLeading: false,
      );
    }

    Widget catalogBtn() {
      return Container(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseCatalogAll()));
            },
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: backgroundColor1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child:
                Text('Explore Catalog', style: TextStyle(color: whiteColor))),
      );
    }

    Widget emptyLibrary() {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/icon_book.png')),
              SizedBox(
                height: 24,
              ),
              Text('Courses tidak ditemukan',
                  style: titlePage.copyWith(color: darkGrey)),
              SizedBox(
                height: 10,
              ),
              catalogBtn()
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
          child: Container(
        margin:
            EdgeInsets.only(top: 10, right: defaultMargin, left: defaultMargin),
        child: ListView(
            children: myCourseProvider.myCourse
                .map((course) => SmallPreviewCard(course))
                .toList()),
      ));
    }

    return SafeArea(
        child: Container(
            child: Column(
      children: [
        header(),
        myCourseProvider.myCourse.length == 0 ? emptyLibrary() : content()
      ],
    )));
  }
}
