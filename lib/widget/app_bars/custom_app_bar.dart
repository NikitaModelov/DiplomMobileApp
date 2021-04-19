import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final Text title;
  final double height;

  CustomAppBar({@required this.title, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: null,
      alignment: Alignment.bottomRight,
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title,
              IconButton(
                  icon: Icon(Icons.filter_list, color: Colors.black),
                  onPressed: null)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(left: 10),
            height: 44,
            decoration: BoxDecoration(
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Colors.black),
                SizedBox(width: 8),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: "Поиск",
                    border: InputBorder.none,
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
