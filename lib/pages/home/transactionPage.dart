// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thinker_app/pages/home/widget/transactionCard.dart';
import 'package:thinker_app/provider/historyTransactionProvider.dart';
import 'package:thinker_app/theme/theme.dart';
import 'package:thinker_app/model/courseModel.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    HistoryTransactionProvider historyTransactionProvider =
        Provider.of<HistoryTransactionProvider>(context);

    Widget emptyCart() {
      return Expanded(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/icon_cart.png')),
              SizedBox(
                height: 24,
              ),
              Text(
                'Belum ada transaksi',
                style: titlePage.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 8,
              ),
              Text('Lakukan transaksi coursemu',
                  style: courseName.copyWith(color: darkGrey))
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.only(
              top: 20, right: defaultMargin, left: defaultMargin, bottom: 20),
          child: ListView(
            children: historyTransactionProvider.transaction
                .map((course) => TransactionCard(course))
                .toList(),
          ),
        ),
      );
    }

    Widget btnClearHistory() {
      return Container(
        margin: EdgeInsets.only(
          right: defaultMargin,
          left: defaultMargin,
        ),
        width: double.infinity,
        height: 50,
        child: TextButton(
          onPressed: () {
            historyTransactionProvider.clearTransaction();
            print(historyTransactionProvider.transaction.length);
          },
          style: TextButton.styleFrom(
              backgroundColor: Color(0xffFC3B3B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text('Hapus Riwayat Transaksi',
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
            title: Text('Transaksi'),
            centerTitle: true,
            backgroundColor: backgroundColor1),
        body: Container(
          margin: EdgeInsets.only(bottom: defaultMargin),
          child: Column(children: [
            // emptyCart()
            historyTransactionProvider.transaction.length == 0
                ? emptyCart()
                : fullContent(),
          ]),
        ));
  }
}
