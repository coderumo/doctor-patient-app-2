import 'package:doktorum/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'dr_register.dart';

class DRlogin extends StatefulWidget {
  const DRlogin({Key? key}) : super(key: key);

  @override
  State<DRlogin> createState() => _DRloginState();
}

class _DRloginState extends State<DRlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Doktor girş ekranına hoş geldiniz',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 50, right: 50),
            child: TextFormField(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
            child: TextFormField(
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
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                color: Colors.green,
                child: const Text(
                  "Giriş Yap",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 100,
                ),
                child: Text(
                  "Hesabın yok mu?",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 6),
                child: TextButton(
                  onPressed: null,
                  child: Text(
                    "Kaydol",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
