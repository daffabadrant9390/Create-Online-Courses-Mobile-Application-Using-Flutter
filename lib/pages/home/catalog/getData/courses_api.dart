import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:thinker_app/model/courseModel.dart';
import 'package:thinker_app/theme/theme.dart';

class CoursesApi {
  static Future<List<Course>> getCoursesLocally(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/json/course_data.json');
    final body = json.decode(data);

    // List selectedItem = body.where((el) => el["category"] == "Design").toList();
    // print(selectedItem);

    // return selectedItem.map<Course>(Course.fromJson).toList();

    return body.map<Course>(Course.fromJson).toList();
  }
}
