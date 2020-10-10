import 'package:blueconnectapp/core/veiwModels/createview_model.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';

import 'base_view.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CreateViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: !model.isSearch
              ? IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: KPrimaryWhite,
            ),
          )
              : Padding(
            padding: EdgeInsets.all(0.0),
            child: IconButton(
              color: KPrimaryWhite,
              icon: Icon(
                Icons.cancel,
              ),
              onPressed: () {
                model.raiseSearch();
              },
            ),
          ),
          backgroundColor: KPrimaryColor2,
          title: !model.isSearch
              ? Text(
            "Blue Connect",
            style: TextStyle(
                color: KPrimaryWhite, fontFamily: 'PoppinsRegular'),
          )
              : TextFormField(
            style: TextStyle(
                color: KPrimaryWhite,
                fontFamily: 'PoppinsRegular',
                fontSize: 18),
            decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: KPrimaryWhite,
                    fontSize: 18,
                    fontFamily: 'PoppinsRegular'),
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              color: KPrimaryWhite,
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                if (model.isSearch) {
                  //  Send the query to search the collection
                }
                model.raiseSearch();
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: !model.isSearch
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                onTap: () {
                  model.navigateToAddScreen();
                },
                leading: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: KPrimaryColor2),
                  child: Icon(
                    Icons.group_add,
                    color: KPrimaryWhite,
                  ),
                ),
                title: Text(
                  "Create Group",
                  style: TextStyle(
                    fontFamily: 'PoppinsRegular',
                    fontSize: 18,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {},
                leading: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: KPrimaryColor2),
                  child: Icon(
                    Icons.group_work,
                    color: KPrimaryWhite,
                  ),
                ),
                title: Text(
                  "Create Community",
                  style: TextStyle(
                    fontFamily: 'PoppinsRegular',
                    fontSize: 18,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {},
                leading: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: KPrimaryColor2),
                  child: Icon(
                    Icons.bubble_chart,
                    color: KPrimaryWhite,
                  ),
                ),
                title: Text(
                  "Create Channel",
                  style: TextStyle(
                    fontFamily: 'PoppinsRegular',
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )
              : ListView.separated(
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: Text('A'),
                foregroundColor: KSecondaryColorGrey,
              ),
              title: Text("User $index"),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 5,
          ),
        ),
      ),
    );
  }
}
