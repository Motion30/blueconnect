import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/veiwModels/groupview_model.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                      title: Text("Group $index"),
                      trailing: Text("Group description"),
                      onTap: () {
                        //  Go to the chat screen
                      },
                      subtitle: Text("News details..."),
                    )),
      ),
    );
  }
}
