import 'package:flutter/material.dart';
import 'package:istishara/homePages/homePageProfessional.dart';
class chat extends StatefulWidget {
  @override
  _chatState createState() => _chatState();
}

class _chatState extends State<chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Messages'),),
    );
  }
}