// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:thinker_app/pages/home/widget/certificate_card.dart';
import 'package:thinker_app/provider/certificateProvider.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:thinker_app/model/courseModel.dart';
import 'package:provider/provider.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CertificateProvider certificateProvider =
        Provider.of<CertificateProvider>(context);

    Widget emptyCertificate() {
      return Expanded(
          child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_certificate_empty.png', width: 100),
            SizedBox(
              height: 24,
            ),
            Text('Tidak ada sertifikat',
                style: titlePage.copyWith(color: darkGrey))
          ],
        ),
      ));
    }

    Widget content() {
      return Expanded(
          child: Container(
        child: ListView(
            children: certificateProvider.certificate
                .map((certificateCourse) => CertificateCard(certificateCourse))
                .toList()),
      ));
    }

    Widget btnClearHistory() {
      return Container(
        margin: EdgeInsets.only(
            right: defaultMargin, left: defaultMargin, bottom: defaultMargin),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            certificateProvider.clearCertificate();
            print(certificateProvider.certificate.length);
          },
          style: TextButton.styleFrom(
              backgroundColor: Color(0xffFC3B3B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text('Hapus Riwayat Sertifikat',
              style: TextStyle(color: whiteColor)),
        ),
      );
    }

    Widget fullContent() {
      return Expanded(
        child: Container(
          child: Column(
            children: [content(), btnClearHistory()],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: backgroundColor1,
        title: Text('Sertifikat Saya'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            certificateProvider.certificate.length == 0
                ? emptyCertificate()
                : fullContent()
          ],
        ),
      ),
    );
  }
}
