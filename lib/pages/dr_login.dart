import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:doktorum/pages/home_page.dart';
import 'package:doktorum/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dr_register.dart';
import 'package:dio/dio.dart';

class DRlogin extends StatefulWidget {
  const DRlogin({Key? key}) : super(key: key);

  @override
  State<DRlogin> createState() => _DRloginState();
}

class _DRloginState extends State<DRlogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool _isLoading = false;

  Future signIn(String email, String pass) async {
    try {
      String url = 'http://10.0.2.2:8081/doktorgiris';
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      Map body = {"email": email, "username": pass};
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
              MaterialPageRoute(builder: (BuildContext context) => HomePage()),
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                // child: TextFormField(
                //   controller: _emailController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                //       borderSide: BorderSide(color: Colors.white),
                //     ),
                //     filled: true,
                //     labelText: "E-mail",
                //     labelStyle: TextStyle(color: Colors.black),
                //   ),
                // ),
                child: TextField(
                  controller: _emailController,
                  obscureText: false,
                  decoration: InputDecoration(hintText: 'email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                // child: TextFormField(
                //   controller: _passController,
                //   obscureText: true,
                //   autovalidateMode: AutovalidateMode.always,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                //       borderSide: BorderSide(color: Colors.white),
                //     ),
                //     filled: true,
                //     labelText: "??ifre",
                //     labelStyle: TextStyle(color: Colors.black),
                //   ),
                // ),
                child: TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'password'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                // child: MaterialButton(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(50.0),
                //     ),
                //     color: Colors.green,
                //     child: Text(
                //       "Giri?? Yap",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     onPressed: _emailController.text == "" ||
                //             _passController.text == ""
                /*         ? null*/
                //         : () {
                //             setState(() {
                //               _isLoading = true;
                //             });
                //             signIn(_emailController.text, _passController.text);
                //           }),

                child: ElevatedButton(
                  onPressed: (_emailController.value == "" ||
                      _passController.value == "")
                      ? () {
                    debugPrint('ohfuh??wfhwhf??');
                  }
                      : (() {
                    setState(() {
                      _isLoading = false;
                    });
                    signIn(_emailController.text, _passController.text);
                  }),
                  child: const Text('Giri?? yap'),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text('??ifremi unuttum'),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 100,
                    ),
                    child: Text(
                      "Hesab??n yok mu?",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 6),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register()),
                            );
                          },
                          child: Text('kaydol'))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}