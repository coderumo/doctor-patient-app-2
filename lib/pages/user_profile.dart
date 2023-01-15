import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            SizedBox(
              width: 30,
            ),
            ImageIcon(
              AssetImage('assets/icons/woman_pp.png'),
              size: 150,
              color: Color.fromARGB(255, 101, 85, 104),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AD'),
                SizedBox(
                  height: 10,
                ),
                Text('SOYAD'),
                SizedBox(
                  height: 10,
                ),
                Text('E-MAIL'),
              ],
            )
          ],
        ) //pp ve kullanıcı bilgileri
      ],
    );
  }
}
