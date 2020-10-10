import 'package:blueconnectapp/core/veiwModels/addview_model.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';

import 'base_view.dart';

import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<AddViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: KPrimaryColor2,
          leading: IconButton(
            onPressed: () {
              model.navigateBack();
            },
            icon: Icon(Icons.arrow_back,),
            color: KPrimaryWhite,
          ),
          title: Text(
            "Add Group",
            style: TextStyle(
              fontFamily: 'PoppinsRegular',
              color: KPrimaryWhite,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontFamily: 'PoppinsRegular',
                      fontSize: 16
                  ),
                ),

                TextFormField(
                  style: TextStyle(
                      color: KSecondaryColorDarkShade,
                      fontFamily: 'PoppinsRegular',
                      fontSize: 16
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter group name.',
                    hintStyle: TextStyle(
                      color: KSecondaryColorDarkGrey,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Text(
                  "Description",
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontFamily: 'PoppinsRegular',
                      fontSize: 16
                  ),
                ),

                TextFormField(
                  style: TextStyle(
                      color: KSecondaryColorDarkShade,
                      fontFamily: 'PoppinsRegular',
                      fontSize: 16
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter description.',
                    hintStyle: TextStyle(
                      color: KSecondaryColorDarkGrey,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Text(
                  "Group Logo",
                  style: TextStyle(
                      color: KPrimaryColor2,
                      fontFamily: 'PoppinsRegular',
                      fontSize: 16
                  ),
                ),

                TextFormField(
                  style: TextStyle(
                      color: KSecondaryColorDarkShade,
                      fontFamily: 'PoppinsRegular',
                      fontSize: 16
                  ),
                  decoration: InputDecoration(
                    hintText: 'Select group logo.',
                    hintStyle: TextStyle(
                      color: KSecondaryColorDarkGrey,
                      fontFamily: 'PoppinsRegular',
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                GestureDetector(
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    decoration: BoxDecoration(
                      color: KPrimaryColor2,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "ADD GROUP",
                        style: TextStyle(
                            color: KPrimaryWhite,
                            fontFamily: "PoppinsRegular",
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
