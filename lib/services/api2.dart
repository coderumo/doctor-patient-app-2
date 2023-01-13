import 'package:dio/dio.dart';
import 'package:doktorum/pages/dr_card_3.dart';
import 'package:flutter/material.dart';

import '../model/dr_model.dart';
import '../pages/dr_card.dart';

class DRapi2 extends StatefulWidget {
  const DRapi2({super.key});

  @override
  State<DRapi2> createState() => _DRapi2State();
}

class _DRapi2State extends State<DRapi2> {
  Future<List<DRModel>> _getDrList() async {
    try {
      var response =
          await Dio().get('https://jsonplaceholder.typicode.com/users');
      debugPrint(response.toString());
      List<DRModel>? _drList = [];
      if (response.statusCode == 200) {
        _drList =
            (response.data as List).map((e) => DRModel.fromMap(e)).toList();
      }
      return _drList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    _getDrList();
    return FutureBuilder<List<DRModel>>(
        future: _getDrList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userList = snapshot.data!;
            return Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var user = userList[index];
                    return DRCard3(user: user);
                  },
                  itemCount: userList.length,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
