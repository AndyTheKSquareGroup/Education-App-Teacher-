import 'package:flutter/material.dart';

class SchoolEventsTeacher extends StatelessWidget {
  String titleEvent = "";
  String content = "";

  SchoolEventsTeacher({
    required this.titleEvent,
    required this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("$titleEvent"),
            Text("$content"),
          ],
        ),
      ),
    );
  }
}
