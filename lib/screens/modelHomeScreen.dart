import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:educationappteacher/screens/getInfoActivitiesScreen.dart';

class ModelNotiStudents extends StatefulWidget {
  const ModelNotiStudents({Key? key}) : super(key: key);
  @override
  _ModelNotiStudentssState createState() => _ModelNotiStudentssState();
}

class _ModelNotiStudentssState extends State<ModelNotiStudents> {
  var RESOURCE = "https://codesundar.com/wp-json/wp/v2/posts";
  var _event = [];
  getInfoForEventsStudents() async {
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
          title: Text(
            "Activities",
          ),
          centerTitle: false,
        ),
        body: Center(
          child: _event.length == 0
              ? Container(
                  height: 300,
                  width: 300,
                  color: Colors.red[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "Welcome TEACHER NAME to new App powered by KSquare Education Institute.",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                          textAlign: TextAlign.center),
                      Container(
                        child: Column(
                          children: [
                            Text("Press to view created activities .",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                textAlign: TextAlign.center),
                            IconButton(
                              onPressed: () {
                                getInfoForEventsStudents();
                              },
                              icon: Icon(
                                Icons.arrow_forward_rounded,
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
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (bc, index) {
                    return Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: Icon(Icons.pending_actions_outlined),
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
                                EventRequestLogic(
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${_event[index]['date']} Published."),
                                      Text("${_event[index]['date_gmt']} due."),
                                    ],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Edit"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red[300],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text("View to Moodle"),
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
      ),
    );
  }
}
