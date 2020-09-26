import 'package:blueconnectapp/screens/select.dart';

import 'channel.dart';
import 'community.dart';
import 'feeds.dart';
import 'chats.dart';
import '../utils/color.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
    static const screenId = 'home_screen';

    @override
    _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Home> with SingleTickerProviderStateMixin {
    TabController _tabController;

    @override
    void initState() {
        // TODO: implement initState
        super.initState();
        _tabController = new TabController(length: 4, vsync: this, initialIndex: 1);
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: KAppbarColor,
                title: Text('Blue connect'),
                bottom: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    tabs: <Widget>[
                        Tab(icon: Icon(Icons.assessment), text: "Feeds",),
                        Tab(icon: Icon(Icons.message),text: "Chats",),
                        Tab(icon: Icon(Icons.group), text: "Groups",),
                        Tab(icon: Icon(Icons.scatter_plot), text: "Channels",),
                    ],
                ),
                actions: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                            onPressed: (){
                            },
                            icon: Icon(Icons.search),
                        ),
                    ),

                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.more_vert),
                        ),
                    ),
                ],
            ),

            body: TabBarView(
                controller: _tabController,
                children: <Widget>[
                    Feeds(),
                    Chat(),
                    Community(),
                    Channel(),
                ],
            ),

            floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.of(context).pushNamed(Select.screenId),
                backgroundColor: KAppbarColor,
                child: Icon(
                    Icons.add,
                    color: Colors.white,
                ),
            ),
        );
    }
}
