import 'package:blueconnectapp/core/enum/chat_type.dart';
import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/veiwModels/homeview_model.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';
import 'package:blueconnectapp/ui/views/channel_list.dart';
import 'package:blueconnectapp/ui/views/groups_list.dart';

import 'base_view.dart';
import 'package:flutter/material.dart';

import 'chat_list.dart';
import 'feeds_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController _searchQuery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelDisposed: (model){
        _searchQuery.dispose();
      },
      onModelReady: (model) {
        _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: model.isSearching? IconButton(
            icon: Icon(
              Icons.cancel,
              color: KPrimaryWhite,
            ),
            onPressed: (){
              // End searching
              model.endSearching();
            },
          ): null,
          title: !model.isSearching
              ? Text(
                  "Blue Connect",
                  style: TextStyle(
                      color: KPrimaryWhite, fontFamily: 'PoppinsRegular'),
                )
              : TextFormField(
                  controller: _searchQuery,
                  style: TextStyle(
                    color: KPrimaryWhite,
                    fontFamily: 'PoppinsRegular',
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search for user',
                    hintStyle: TextStyle(
                      color: KPrimaryWhite,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: IconButton(
                splashRadius: 20,
                onPressed: () {
                  // Open the search field if is searching is not enabled
                  if(!model.isSearching) model.startSearching();
                  if(_searchQuery.text.isNotEmpty) model.searchForUser(username: _searchQuery.text);
                },
                icon: Icon(
                  !model.isSearching ?
                  Icons.search : Icons.send,
                  color: KPrimaryWhite,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PopupMenuButton(
                child: Icon(
                  Icons.more_vert,
                  color: KPrimaryWhite,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: GestureDetector(
                    onTap: () {
                      model.navigateToProfile();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle,
                          color: KSecondaryColorDarkGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Profile")
                      ],
                    ),
                  )),
                  PopupMenuItem(
                      child: GestureDetector(
                    onTap: () {
                      model.navigateToSettings();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: KSecondaryColorDarkGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Setting")
                      ],
                    ),
                  )),
                  PopupMenuItem(
                      child: GestureDetector(
                    onTap: () async {
                      await model.signOut();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: KSecondaryColorDarkGrey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Sign Out")
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ],
          backgroundColor: KPrimaryColor2,
          bottom: !model.isSearching? TabBar(
              controller: _tabController,
              indicatorColor: KPrimaryWhite,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.public,
                    color: KPrimaryWhite,
                  ),
                  child: Text(
                    "Feeds",
                    style: TextStyle(
                        color: KPrimaryWhite,
                        fontFamily: 'PoppinsRegular',
                        fontSize: 13),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.chat,
                    color: KPrimaryWhite,
                  ),
                  child: Text(
                    "Chat",
                    style: TextStyle(
                        color: KPrimaryWhite,
                        fontFamily: 'PoppinsRegular',
                        fontSize: 13),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.people,
                    color: KPrimaryWhite,
                  ),
                  child: Text(
                    "Group",
                    style: TextStyle(
                        color: KPrimaryWhite,
                        fontFamily: 'PoppinsRegular',
                        fontSize: 13),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.live_tv_rounded,
                    color: KPrimaryWhite,
                  ),
                  child: Text(
                    "Channel",
                    style: TextStyle(
                        color: KPrimaryWhite,
                        fontFamily: 'PoppinsRegular',
                        fontSize: 13),
                  ),
                )
              ]) :  null,
        ),
        body: Container(
          height: model.state == ViewState.Busy ?  MediaQuery.of(context).size.height : null,
          child: !model.isSearching?
          TabBarView(
            controller: _tabController,
            children: [
              FeedsList(),
              ChatList(
                chat: ChatType.Private,
              ),
              GroupList(),
              ChannelList(),
            ],
          )
          : model.state == ViewState.Busy?
            Center(
              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(KPrimaryColor2),),
            )
          :ListView.separated(
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                child: Text('A'),
                foregroundColor: KSecondaryColorGrey,
                backgroundColor: KPrimaryColor2,
              ),
              title: Text("User $index"),
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 5,
          ),
        ),
        floatingActionButton: !model.isSearching?
        FloatingActionButton(
          backgroundColor: KPrimaryColor2,
          onPressed: () {
            model.navigateToCreateScreen();
          },
          child: Icon(
            Icons.add,
            color: KPrimaryWhite,
          ),
        )
        : null,
      ),
    );
  }
}
