import 'package:flutter/material.dart';

import '../model/dr_model.dart';

class DRCard extends StatefulWidget {
  const DRCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  final DRModel user;

  @override
  State<DRCard> createState() => _DRCardState();
}

class _DRCardState extends State<DRCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 16, 89, 111),
            Color.fromARGB(255, 46, 187, 209)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText("name: ", widget.user.name.toString()),
              buildText("name: ", widget.user.username.toString()),
              buildText("e-mail: ", widget.user.email.toString()),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(40)),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildText(String str, dynamic str2) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      child: Row(
        children: [
          Text(
            '$str',
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${str2.toString()}',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
