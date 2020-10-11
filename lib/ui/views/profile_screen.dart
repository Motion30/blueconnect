import 'package:blueconnectapp/core/veiwModels/profileview_model.dart';
import 'package:flutter/material.dart';
import 'base_view.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      builder: (context, model, child) => SingleChildScrollView(
        child: Container(
          
        ),
      ),
    );
  }
}
