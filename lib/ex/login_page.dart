import 'dart:convert';

import 'package:flutter_rice_app/ex/sushi.dart';
import 'package:flutter_rice_app/ex/register_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();

  bool loginFail = false;
  bool passwordHidden = true;

  TextEditingController _usernameController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            children: [
              buildLogo(context),
              SizedBox(
                height: 20,
              ),
              buildForm(context),
              SizedBox(
                height: 20,
              ),
              buildButton(context)
            ],
          ),
        ),
      ),
    );
  }

  buildLogo(BuildContext context) {
    return (Center(
      child: Image(
        image: AssetImage('assets/images/evnlogo.png'),
        width: 180,
      ),
    ));
  }

  buildForm(BuildContext context) {
    return (Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập tên đăng nhập";
                } else if (value.length < 5) {
                  return "Tên đăng nhập quá ngắn";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text("Tên đăng nhập"),
                hintText: "Vui lòng nhập tên đăng nhập",
                labelStyle: TextStyle(color: Colors.orange),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập mật khẩu";
                } else if (value.length < 5) {
                  return "Mật khẩu quá ngắn";
                }
                return null;
              },
              obscureText: passwordHidden,
              decoration: InputDecoration(
                  label: Text("Mật khẩu"),
                  hintText: "Vui lòng nhập mật khẩu",
                  labelStyle: TextStyle(color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.key),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordHidden = !passwordHidden;
                        });
                      },
                      icon: Icon(Icons.remove_red_eye)),
                  errorText: loginFail ? 'Mật khẩu không chính xác' : null),
            )
          ],
        )));
  }

  buildButton(BuildContext context) {
    return (Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final response = await http.post(
                Uri.parse('https://fakestoreapi.com/auth/login'),
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: jsonEncode(<String, String>{
                  'username': _usernameController.text,
                  'password': _passwordController.text
                }),
              );
              if (response.statusCode == 200) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Sushi()));
              } else {
                setState(() {
                  loginFail = true;
                });
              }
            }
          },
          child: Text("Đăng nhập"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.maxFinite, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegisterPage()));
          },
          child: Text("Đăng ký"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.maxFinite, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],
    ));
  }
}
