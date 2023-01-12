import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrCard2 extends StatelessWidget {
  final String doctorImagePath;
  final String raiting;
  final String doctorName;
  final String doctorProfession;

  DrCard2({
    required this.doctorImagePath,
    required this.doctorName,
    required this.raiting,
    required this.doctorProfession,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 221, 167, 147),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Image.asset(
              doctorImagePath,
              height: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  raiting,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              doctorName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(
              height: 6,
            ),
            Text(doctorProfession),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.comment,
                  color: Colors.blueGrey,
                  size: 25,
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
          ],
        ),
      ),
    );
  }
}
