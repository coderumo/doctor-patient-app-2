import 'package:doktorum/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DRProfile extends StatefulWidget {
  //final String value;

  //DRProfile({Key? key, required this.value}) : super(key: key);

  @override
  State<DRProfile> createState() => _DRProfileState();
}

class _DRProfileState extends State<DRProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 16, 89, 111),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          SizedBox(
            width: 280,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HomePage())));
              },
              icon: Icon(Icons.arrow_back_ios)),
        ],
      ),
      body: Text(
        'doktor profili',
        style: TextStyle(fontSize: 40),
      ), //Text("${widget.value}"
    );
  }
}
