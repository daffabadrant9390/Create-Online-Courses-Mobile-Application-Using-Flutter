// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:thinker_app/model/courseModel.dart';

class MyCourseProvider with ChangeNotifier {
  List<Course> _myCourse = [];

  List<Course> get myCourse => _myCourse;

  set myCourse(List<Course> myCourse) {
    _myCourse = myCourse;
    notifyListeners();
  }

  setCourse(Course? course) {
    if (!isCouseEnrolled(course)) {
      _myCourse.add(course!);
    } else {
      _myCourse.removeWhere((element) => element.id == course?.id);
    }

    notifyListeners();
  }

  addMyCourse(Course? course) {
    if (!isCouseEnrolled(course)) {
      _myCourse.add(course!);
    } else {
      return false;
    }
    notifyListeners();
  }

  removeMyCourse(Course? course) {
    if (isCouseEnrolled(course)) {
      _myCourse.removeWhere((element) => element.id == course?.id);
    }

    notifyListeners();
  }

  isCouseEnrolled(Course? course) {
    if (_myCourse.indexWhere((element) => element.id == course?.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
