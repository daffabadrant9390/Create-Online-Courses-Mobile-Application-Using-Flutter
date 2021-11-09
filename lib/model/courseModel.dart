// ignore_for_file: file_names

import 'package:meta/meta.dart';

class Course {
  final int id;
  final String category;
  final String title;
  final String urlImageSmall;
  final String urlImageBig;
  final String certificateImg;
  final String material1Title;
  final String material2Title;
  final String material3Title;
  final String material1Content;
  final String material2Content;
  final String material3Content;
  final String material1Image;
  final String material2Image;
  final String material3Image;

  const Course({
    required this.id,
    required this.category,
    required this.title,
    required this.urlImageSmall,
    required this.urlImageBig,
    required this.certificateImg,
    required this.material1Title,
    required this.material2Title,
    required this.material3Title,
    required this.material1Content,
    required this.material2Content,
    required this.material3Content,
    required this.material1Image,
    required this.material2Image,
    required this.material3Image,
  });

  static Course fromJson(json) => Course(
        id: json['id'],
        category: json['category'],
        title: json['title'],
        urlImageSmall: json['urlImageSmall'],
        urlImageBig: json['urlImageBig'],
        certificateImg: json['certificateImg'],
        material1Title: json['material1Title'],
        material2Title: json['material2Title'],
        material3Title: json['material3Title'],
        material1Content: json['material1Content'],
        material2Content: json['material2Content'],
        material3Content: json['material3Content'],
        material1Image: json['material1Image'],
        material2Image: json['material2Image'],
        material3Image: json['material3Image'],
      );
}
