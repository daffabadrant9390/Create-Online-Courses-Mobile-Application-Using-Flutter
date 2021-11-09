// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:thinker_app/theme/theme.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: backgroundColor1,
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: myController,
                    style: TextStyle(color: whiteColor),
                    decoration: InputDecoration.collapsed(
                        hintText: widget.hintText,
                        hintStyle: TextStyle(color: darkGrey)),
                    onChanged: widget.onChanged,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.search,
                  color: darkGrey,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
