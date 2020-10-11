import 'package:blueconnectapp/core/veiwModels/settingsview_model.dart';
import 'package:blueconnectapp/ui/widgets/input_label.dart';
import 'package:blueconnectapp/ui/widgets/page_description.dart';
import 'package:blueconnectapp/ui/widgets/page_title.dart';
import 'package:blueconnectapp/ui/widgets/round_btn.dart';
import 'package:flutter/material.dart';
import 'base_view.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      builder: (context, model, child) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              PageTitle(
                title: "Settings",
              ),

              PageDescription(description: "Update your account password here.",),

              InputLabel(
                label: "PASSWORD",
              ),
              TextFormField(
                controller: _password,
              ),
              SizedBox(
                height: 30,
              ),

              InputLabel(
                label: "CONFIRM PASSWORD",
              ),
              TextFormField(
                controller: _cpassword,
              ),

              SizedBox(
                height: 50,
              ),

              RoundButton(
                btnTitle: "UPDATE PASSWORD",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
