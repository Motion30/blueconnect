import 'package:blueconnectapp/core/veiwModels/profileview_model.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';
import 'package:blueconnectapp/ui/widgets/input_label.dart';
import 'package:blueconnectapp/ui/widgets/page_description.dart';
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
      onModelReady: (model){
        _email.text = model.email;
        _fullName.text = model.fullName;
        _phone.text = model.phone;
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: KPrimaryColor2,
          title: Text(
            "Profile",
            style: TextStyle(
              color: KPrimaryWhite,
              fontFamily: 'PoppinsRegular'
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PageTitle(
                  title: "Profile",
                ),
                PageDescription(description: "Update your profile info here",),

                SizedBox(height: 30,),

                InputLabel(
                  label: "USERNAME",
                ),
                TextFormField(
                  controller: _fullName,
                  decoration: InputDecoration(

                  ),
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
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: KSecondaryColorDarkGrey,
                    ),
                    hintText: "What's your mantra"
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RoundButton(
                  btnTitle: "UPDATE PROFILE",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}