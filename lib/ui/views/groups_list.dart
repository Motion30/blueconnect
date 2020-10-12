import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/veiwModels/groupview_model.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';
import 'base_view.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<GroupViewModel>(
      onModelReady: (model) {
        model.listenToGroups();
      },
      builder: (context, model, child) => Container(
        height: model.state == ViewState.Busy
            ? MediaQuery.of(context).size.height
            : null,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: model.groups.length == 0
            ? Center(
                child: Image(
                    width: 250,
                    height: 250,
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "assets/images/empty.png",
                    )),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: model.groups.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(
                        model.groups[index].name,
                        style: TextStyle(
                            color: KSecondaryColorLightDark,
                            fontFamily: 'PoppinsSemiBold'),
                      ),
                      trailing: model.groups[index].admin != model.user ?  FlatButton(
                        color: KPrimaryColor2,
                        onPressed: () {
                          // Add the user to the group
                        },
                        child: Text(
                          "JOIN",
                          style: TextStyle(
                            color: KPrimaryWhite,
                            fontFamily: 'PoppinsRegular',
                          ),
                        ),
                      ) : null,
                      onTap: () {
                        //  Go to the chat screen
                        if(model.groups[index].admin == model.user || model.groups[index].users.contains(model.user)){

                        }
                      },
                      subtitle: Text(
                        model.groups[index].description,
                        style: TextStyle(
                          color: KSecondaryColorLightDark,
                          fontFamily: 'PoppinsRegular'
                        ),
                      ),
                    )),
      ),
    );
  }
}
