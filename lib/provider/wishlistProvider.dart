// ignore_for_file: file_names

import 'package:thinker_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:thinker_app/model/courseModel.dart';

class WishlistProvider with ChangeNotifier {
  List<Course> _wishlist = [];

  List<Course> get wishlist => _wishlist;

  set wishlist(List<Course> wishlist) {
    _wishlist = wishlist;
    notifyListeners();
  }

  setWishlist(Course? course) {
    if (!isWishlist(course)) {
      _wishlist.add(course!);
    } else {
      _wishlist.removeWhere((element) => element.id == course?.id);
    }

    notifyListeners();
  }

  isWishlist(Course? course) {
    if (_wishlist.indexWhere((element) => element.id == course?.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
