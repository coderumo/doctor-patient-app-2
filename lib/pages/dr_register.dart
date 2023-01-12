import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrRegister extends StatefulWidget {
  const DrRegister({super.key});

  @override
  State<DrRegister> createState() => _DrRegisterState();
}

class _DrRegisterState extends State<DrRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.always,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
              filled: true,
              labelText: "Ad",
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
