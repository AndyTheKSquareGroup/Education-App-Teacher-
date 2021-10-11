import 'package:flutter/material.dart';
import 'package:educationappteacher/screens/editProfileScreen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:educationappteacher/screens/eventsInfoSchoolScreen.dart';

class FourthManageProfileStudents extends StatefulWidget {
  const FourthManageProfileStudents({Key? key}) : super(key: key);
  @override
  _FourthManageProfileStudentsState createState() =>
      _FourthManageProfileStudentsState();
}

class _FourthManageProfileStudentsState
    extends State<FourthManageProfileStudents> {
  var isSwitched = true;

  //School events
  var RESOURCE = "https://codesundar.com/wp-json/wp/v2/posts";
  var _event = [];
  getSchoolEventsInfo() async {
    try {
      await http.get(Uri.parse(RESOURCE)).then((res) {
        print("sucess");
        print(res.body);
        var resp = json.decode(res.body);
        setState(() {
          _event = resp;
        });
        _event = resp;
      }).catchError((e) {
        print("Error");
        print(e);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[200],
          elevation: 0,
          title: Text("Account"),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Container(
              height: 262,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 77,
                    margin: EdgeInsets.all(5),
                    color: Colors.red[100],
                    padding: EdgeInsets.all(7),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          child: CircleAvatar(
                            backgroundImage: AssetImage("images/profile.jfif"),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                child: Text(
                                  "Teacher Name",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 7),
                                child: Text("Institutional Email"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {
                              Get.to(FirstEditProfile());
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(color: Colors.red[300]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 77,
                    margin: EdgeInsets.all(5),
                    color: Colors.red[100],
                    padding: EdgeInsets.all(7),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          child: Icon(
                            Icons.notifications_on_outlined,
                            color: Colors.red[300],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Notifications",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Turn on/off Notification"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Colors.redAccent[300],
                            activeColor: Colors.red[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 77,
                    margin: EdgeInsets.all(5),
                    color: Colors.red[100],
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          child: Icon(
                            Icons.grade_outlined,
                            color: Colors.red[300],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Students",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    "Summary all students and their grades"),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: TextButton(
                            onPressed: () {},
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_rounded,
                                  color: Colors.red[300]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _event.length == 0
                  ? Container(
                      color: Colors.red[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                              "Welcome TEACHER NAME to new App powered by KSquare Education Institute.",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                              textAlign: TextAlign.center),
                          Container(
                            child: Column(
                              children: [
                                Text("Press to view nearby school events.",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black),
                                    textAlign: TextAlign.center),
                                IconButton(
                                  onPressed: () {
                                    getSchoolEventsInfo();
                                  },
                                  icon: Icon(
                                    Icons.done_sharp,
                                    color: Colors.red[300],
                                    size: 45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(5),
                      itemCount: _event.length,
                      itemBuilder: (bc, index) {
                        return Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ListTile(
                                leading: Icon(Icons.emoji_events_sharp),
                                title: Text(
                                  "${_event[index]['title']['rendered']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // decoration: TextDecoration.underline,
                                    // decorationColor: Colors.grey,
                                  ),
                                ),
                                tileColor: Colors.red[200],
                                subtitle: Text(
                                  "${_event[index]['yoast_head_json']['description']} VIEW MORE...",
                                ),
                                onTap: () {
                                  Get.to(
                                    SchoolEventsTeacher(
                                      titleEvent: _event[index]['title']
                                          ['rendered'],
                                      content: _event[index]['yoast_head_json']
                                          ['description'],
                                    ),
                                  );
                                },
                              ),
                              Container(
                                color: Colors.red[100],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "${_event[index]['date']} Published"),
                                          Text(
                                              "${_event[index]['date_gmt']} event day"),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Confirm"),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red[300],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
