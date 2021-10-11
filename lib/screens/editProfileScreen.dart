import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:educationappteacher/screens/loginScreen.dart';

class FirstEditProfile extends StatefulWidget {
  const FirstEditProfile({Key? key}) : super(key: key);
  @override
  _FirstEditProfileState createState() => _FirstEditProfileState();
}

class _FirstEditProfileState extends State<FirstEditProfile> {
  TextEditingController _nameUser = TextEditingController(text: "Teacher Name");
  TextEditingController _emailCtrl =
      TextEditingController(text: "teacher@theksquaregroup.com");
  TextEditingController _mobileCtrl = TextEditingController(text: "9832371920");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        elevation: 0,
        title: Text(
          "Edit Profile",
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(25),
                  height: 150,
                  width: 150,
                  child: CircleAvatar(
                      backgroundImage: AssetImage("images/profile.jfif")),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: _nameUser,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Full Name",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: _emailCtrl,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Email Address",
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          controller: _mobileCtrl,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Mobile Number"),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                          onPressed: () {
                            print(_emailCtrl.text);
                            print(_mobileCtrl);
                            print(_nameUser);
                            Get.to(LoginScreen());
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 50),
                              primary: Colors.red[300]),
                          child: Text(
                            "Save Changes",
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
                Container(
                  child: TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      "Logout",
                      style: TextStyle(
                          color: Colors.red[300],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
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
