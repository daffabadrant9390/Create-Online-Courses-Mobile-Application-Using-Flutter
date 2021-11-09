// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/pages/courses/enrolled/materialCourseTemplate.dart';
import 'package:thinker_app/pages/courses/materials/materialTemplate.dart';
import 'package:thinker_app/theme/theme.dart';

class ManualEnrolledPage extends StatelessWidget {
  const ManualEnrolledPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageCourse() {
      return Container(
        // ignore: prefer_const_constructors
        child: Image(
          image: AssetImage('assets/images/web1_big.png'),
          height: 250,
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, top: defaultMargin),
        child: Column(children: [
          Text(
            'Fundamental HTML',
            style: titlePage,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Web Development',
            style: courseName.copyWith(color: darkGrey, fontSize: 10),
          ),
        ]),
      );
    }

    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: backgroundColor1,
          title: Text('My Course'),
          centerTitle: true,
        ),
        body: Container(
            child: Column(
          children: [
            imageCourse(),
            description(),
            MaterialCourseTemplate(
              materialTitle: 'Pendahuluan',
              materialRoute: MaterialTemplate(
                  title: 'Pendahuluan',
                  courseImageUrl: 'assets/images/material1.png',
                  textContentCourse:
                      'Selamat datang teman-teman pada course Fundamental HTML ini. Pada course ini, kita akan mempelajari dasar-dasar dari pemrograman web. Selain itu, kita akan mempelajari apa itu HTML, fungsi, tujuan, dan syntaxnya. \nUntuk materi ini, tools yang akan digunakan adalah code editor Visual Studio Code dan browser. Ayo persiapkan diri teman-teman, kami tunggu dikelas ya!'),
            ),
            MaterialCourseTemplate(
              materialTitle: 'Apa itu Website',
              materialRoute: MaterialTemplate(
                title: 'Apa itu Website',
                courseImageUrl: 'assets/images/material2.png',
                textContentCourse:
                    'Website adalah sebuah kumpulan halaman yang berisi informasi tertentu dan dapat diakses oleh banyak orang melalui internet. Website dapat dibuka dengan menuliskan URL atau alamat website di browser. \nWebsite pertama kali dibuat oleh Tim Berners-Lee pada akhir 1980an dan baru resmi online pada tahun 1991. Tujuan awal Tim Berners-Lee membuat sebuah website adalah supaya lebih memudahkan para peneliti di tempatnya bekerja ketika akan bertukar atau melakukan perubahan informasi.',
              ),
            ),
            MaterialCourseTemplate(
              materialTitle: 'Pengertian dan Sejarah HTML',
              materialRoute: MaterialTemplate(
                  title: 'Pengertian dan Sejarah HTML',
                  courseImageUrl: 'assets/images/material3_video.png',
                  textContentCourse:
                      'HTML adalah singkatan dari Hypertext Markup Language, yaitu bahasa markup standar untuk membuat dan menyusun halaman dan aplikasi web. Anda bisa menggunakan bahasa markup ini untuk bagian paragraf, heading, maupun link pada suatu web page. \nHTML dibuat oleh Tim Berners-Lee, seorang ahli fisika di lembaga penelitian CERN yang berlokasi di Swiss. Versi pertamanya dirilis pada tahun 1991, dengan 18 tag. \nBerkat popularitasnya yang terus meningkat, bahasa markup ini kini dianggap sebagai standar web resmi. Spesifikasi HTML dikelola dan dikembangkan oleh World Wide Web Consortium (W3C). '),
            ),
          ],
        )));
  }
}
