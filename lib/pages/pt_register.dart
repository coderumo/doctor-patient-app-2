import 'package:doktorum/pages/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'home_page.dart';

import 'package:doktorum/pages/first_page.dart';
import 'package:doktorum/pages/dr_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doktorum/pages/home_page.dart';
import 'package:doktorum/pages/register_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class PtRegister extends StatefulWidget {
  const PtRegister({super.key});

  @override
  State<PtRegister> createState() => _PtRegisterState();
}

class _PtRegisterState extends State<PtRegister> {
  TextEditingController _adController = TextEditingController();
  TextEditingController _soyadController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  bool _isLoading = false;

  Future signIn(String ad,String soyad,String email, String pass) async {
    try {
      String url = 'http://10.0.2.2:8081/hastaekleme';
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      Map body = {"hasta_ad": ad,"hasta_soyad": soyad,"hasta_mail": email, "hasta_sifre": pass};
      // ignore: prefer_typing_uninitialized_variables
      var jsonResponse;
      var res = await http.post(Uri.parse(url), body: body);
      debugPrint(res.statusCode.toString());

      if (res.statusCode != 299) {
        jsonResponse = json.decode(res.body);

        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });

          //sharedPreferences.setString("token", jsonResponse["token"]);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => FirstPage()),
                  (Route<dynamic> route) => false);
        }
        print("response status: ${res.body}");
      } else {
        setState(() {
          _isLoading = false;
        });
        print("response status: ${res.body}");
      }
    } catch (e) {
      debugPrint('hata oldu');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            children: [
              TextFormField(
                controller: _adController,
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
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _soyadController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  labelText: "Soyad",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _emailController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _passController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  labelText: "Şifre",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: (_emailController.value == "" ||
                    _passController.value == "")
                    ? () {
                  debugPrint('ohfuhşwfhwhfş');
                }
                    : (() {
                  setState(() {
                    _isLoading = false;
                  });
                  signIn(_adController.text,_soyadController.text, _emailController.text, _passController.text);
                }),
                child: const Text('Kayıt Ol'),
              ),
              const SizedBox(
                height: 30,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FirstPage()));
                  },
                  icon: Icon(Icons.arrow_back))
            ],
          ),
        ),
      ),
    );
  }
}