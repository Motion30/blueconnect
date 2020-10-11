import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/veiwModels/feedsview_model.dart';

import 'base_view.dart';
import 'package:flutter/material.dart';

class FeedsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FeedsViewModel>(
      builder: (context, model, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: model.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: model.feeds.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(model.feeds[index].title),
                      trailing: Text('${model.feeds[index].publishedAt}'),
                      onTap: () {
                        //  Go to the web view
                      },
                      subtitle: Text(model.feeds[index].description),
                    )),
      ),
    );
  }
}
