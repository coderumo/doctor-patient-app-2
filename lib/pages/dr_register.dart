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

class DrRegister extends StatefulWidget {
  const DrRegister({super.key});

  @override
  State<DrRegister> createState() => _DrRegisterState();
}

class _DrRegisterState extends State<DrRegister> {
  TextEditingController _adController = TextEditingController();
  TextEditingController _soyadController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _fakController = TextEditingController();
  TextEditingController _haneController = TextEditingController();
  TextEditingController _uzmanController = TextEditingController();
  TextEditingController _klinikController = TextEditingController();

  bool _isLoading = false;

  Future signIn(String ad,String soyad,String email, String pass,String fak,String hane,String uzman,String klinik) async {
    try {
      String url = 'http://10.0.2.2:8081/doktorekleme';
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      Map body = {"doktor_ad": ad,"doktor_soyad": soyad,"doktor_mail": email, "doktor_sifre": pass,"doktor_fak": fak,"doktor_hane": hane,"doktor_uzman": uzman,"doktor_klinik": klinik};
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
              TextFormField(
                controller: _fakController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  labelText: "Fakülte",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _uzmanController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  labelText: "Uzmanlık",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _haneController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  labelText: "Hastane",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _klinikController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  filled: true,
                  labelText: "Klinik",
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
                  signIn(_adController.text,_soyadController.text, _emailController.text, _passController.text,_fakController.text,_haneController.text,_uzmanController.text,_klinikController.text );
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