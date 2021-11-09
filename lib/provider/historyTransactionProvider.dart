// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:thinker_app/model/courseModel.dart';

class HistoryTransactionProvider with ChangeNotifier {
  List<Course> _transaction = [];

  List<Course> get transaction => _transaction;

  set transaction(List<Course> transaction) {
    _transaction = transaction;
    notifyListeners();
  }

  setTransaction(Course? course) {
    if (!isTransaction(course)) {
      _transaction.add(course!);
    } else {
      _transaction.removeWhere((element) => element.id == course?.id);
    }
    notifyListeners();
  }

  addTransaction(Course? course) {
    if (!isTransaction(course)) {
      _transaction.add(course!);
    }
    notifyListeners();
  }

  removeTransaction(Course? course) {
    if (isTransaction(course)) {
      _transaction.removeWhere((element) => element.id == course?.id);
    }

    notifyListeners();
  }

  clearTransaction() {
    _transaction.clear();
    notifyListeners();
  }

  isTransaction(Course? course) {
    if (_transaction.indexWhere((element) => element.id == course?.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
