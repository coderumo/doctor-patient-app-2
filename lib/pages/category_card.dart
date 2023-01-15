import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Category extends StatelessWidget {
  final iconImagePath;
  final String categoryName;

  Category({required this.iconImagePath, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 16, 89, 111),
              Color.fromARGB(255, 46, 187, 209)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Image.asset(
            iconImagePath,
            height: 50,
          ),
          SizedBox(
            width: 10,
          ),
          Text(categoryName),
        ],
      ),
    );
  }
}
