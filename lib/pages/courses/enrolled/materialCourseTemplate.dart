// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/theme/theme.dart';

class MaterialCourseTemplate extends StatelessWidget {
  var materialTitle;
  var materialRoute;

  MaterialCourseTemplate({Key? key, this.materialTitle, this.materialRoute})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(right: defaultMargin, left: defaultMargin, top: 20),
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: backgroundColor3),
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Text(materialTitle,
                style: TextStyle(color: lightGrey, fontSize: 18)),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => materialRoute));
              },
              child: Image(
                  image: AssetImage('assets/images/icon_forward.png'),
                  width: 10),
            )
          ],
        ));
  }
}
