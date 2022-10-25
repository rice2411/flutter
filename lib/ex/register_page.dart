import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  var _formKey = GlobalKey<FormState>();
  var _pass = "";

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
                  prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập mật khẩu";
                } else if (value.length < 5) {
                  return "Mật khẩu quá ngắn";
                } else {
                  _pass = value;
                  return null;
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                  label: Text("Mật khẩu"),
                  hintText: "Vui lòng nhập mật khẩu",
                  labelStyle: TextStyle(color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.key)),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Vui lòng nhập xác nhận mật khẩu";
                } else if (value.length < 5) {
                  return "Xác nhận mật khẩu quá ngắn";
                } else if (value != _pass) {
                  return "Mật khẩu xác nhận không chính xác";
                }
                return null;
              },
              obscureText: true,
              decoration: InputDecoration(
                  label: Text("Xác nhận mật khẩu"),
                  hintText: "Vui lòng nhập xác nhận mật khẩu",
                  labelStyle: TextStyle(color: Colors.orange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  prefixIcon: Icon(Icons.key)),
            )
          ],
        )));
  }

  buildButton(BuildContext context) {
    return (Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Form Ok
            } else {
              // Form not Ok
            }
          },
          child: Text("Đăng ký"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.maxFinite, 60),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Đăng nhập"),
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
