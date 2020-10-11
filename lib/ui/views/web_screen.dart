import 'base_view.dart';
import 'package:flutter/material.dart';


class WebScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Blue Connect",
          style: TextStyle(
            fontFamily: 'PoppinsRegular',
          ),
        ),
      ),
      body: Container(),
    );
  }
}
