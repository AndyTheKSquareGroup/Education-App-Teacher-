import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:educationappteacher/screens/loginScreen.dart';

class TwoCreateAccount extends StatefulWidget {
  const TwoCreateAccount({Key? key}) : super(key: key);
  @override
  _TwoCreateAccountState createState() => _TwoCreateAccountState();
}

class _TwoCreateAccountState extends State<TwoCreateAccount> {
  final TextEditingController _nameUser =
      TextEditingController(text: "Teacher name");
  final TextEditingController _emailCtrl =
      TextEditingController(text: "example@dominio.com");
  final TextEditingController _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        elevation: 0,
        title: const Text(
          "Create New Account",
          // style: TextStyle(color: Colors.blue[400]),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: const AssetImage("images/logo.jpg"),
                  radius: 80,
                  backgroundColor: Colors.red[200],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: const Text(
                    "KSquare Education Institute",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: _nameUser,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Full Name",
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: _emailCtrl,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email Address",
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: _passwordCtrl,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(const LoginScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            primary: Colors.red[300],
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const LoginScreen());
                  },
                  child: Text(
                    "Already Have Account",
                    style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.facebook_rounded,
                          size: 35,
                          color: Colors.red[200],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.email_rounded,
                          size: 35,
                          color: Colors.red[200],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
