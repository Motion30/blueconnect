import 'package:blueconnectapp/core/veiwModels/feedsview_model.dart';

import 'base_view.dart';
import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FeedsViewModel>(
      builder: (context, model, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              title: Text("Feeds Message $index"),
              trailing: Text("${index}th of Oct."),
              onTap: (){
                //  Go to the web view
              },
              subtitle: Text("News details..."),
            )
        ),
      ),
    );
  }
}
