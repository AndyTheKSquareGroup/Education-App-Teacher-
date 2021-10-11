import 'package:flutter/material.dart';

class EventRequestLogic extends StatelessWidget {
  String titleEvent = "";
  String content = "";

  EventRequestLogic({required this.titleEvent, required this.content});
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
