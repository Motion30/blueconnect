import 'package:blueconnectapp/core/veiwModels/profileview_model.dart';
import 'package:blueconnectapp/ui/widgets/input_label.dart';
import 'package:blueconnectapp/ui/widgets/page_title.dart';
import 'package:blueconnectapp/ui/widgets/round_btn.dart';
import 'package:flutter/material.dart';
import 'base_view.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _fullName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _quote = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      builder: (context, model, child) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              PageTitle(
                title: "Profile",
              ),
              InputLabel(
                label: "USERNAME",
              ),
              TextFormField(
                controller: _fullName,
              ),
              SizedBox(
                height: 30,
              ),
              InputLabel(
                label: "EMAIL",
              ),
              TextFormField(
                controller: _email,
              ),
              SizedBox(
                height: 30,
              ),
              InputLabel(
                label: "PHONE",
              ),
              TextFormField(
                controller: _phone,
              ),
              SizedBox(
                height: 30,
              ),
              InputLabel(
                label: "QUOTE",
              ),
              TextFormField(
                controller: _quote,
              ),
              SizedBox(
                height: 30,
              ),
              RoundButton(
                btnTitle: "UPDATE",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
