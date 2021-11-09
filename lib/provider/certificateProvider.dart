// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/model/courseModel.dart';
import 'package:thinker_app/theme/theme.dart';

class CertificateProvider with ChangeNotifier {
  List<Course> _certificate = [];

  List<Course> get certificate => _certificate;

  set certificate(List<Course> certificate) {
    _certificate = certificate;
    notifyListeners();
  }

  setCertificate(Course? course) {
    if (!isCertificate(course)) {
      _certificate.add(course!);
    } else {
      _certificate.removeWhere((element) => element.id == course?.id);
    }
    notifyListeners();
  }

  addCertificate(Course? course) {
    if (!isCertificate(course)) {
      _certificate.add(course!);
    } else {
      return false;
    }
    notifyListeners();
  }

  clearCertificate() {
    _certificate.clear();
    notifyListeners();
  }

  isCertificate(Course? course) {
    if (_certificate.indexWhere((element) => element.id == course?.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
