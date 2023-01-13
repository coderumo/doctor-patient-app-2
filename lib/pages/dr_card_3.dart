import 'package:flutter/material.dart';
import 'dart:math';
import '../model/dr_model.dart';

class DRCard3 extends StatelessWidget {
  const DRCard3({
    Key? key,
    required this.user,
  }) : super(key: key);

  final DRModel user;

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    // ignore: unused_local_variable
    int randomNumber = random.nextInt(5);
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 221, 167, 147),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 10, left: 60),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/icons/man_pp.png',
                          height: 40,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 15,
                            ),
                            Text(
                              randomNumber.toDouble().toString(),
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    )),
                buildText("name: ", user.name.toString()),
                buildText("user name: ", user.username.toString()),
                buildText("e-mail: ", user.email.toString()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.comment,
                        color: Colors.blueGrey,
                        size: 15,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text(
                        'Yorum yaz',
                        style: TextStyle(color: Colors.blueGrey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
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
