import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/dr_model.dart';
import 'dr_card.dart';

class DRapi extends StatefulWidget {
  const DRapi({super.key});

  @override
  State<DRapi> createState() => _DRapiState();
}

class _DRapiState extends State<DRapi> {
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
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var user = userList[index];
                    return DRCard(user: user);
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
