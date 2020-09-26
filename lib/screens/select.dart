import 'package:flutter/material.dart';
import 'add_community.dart';
import 'add_groups.dart';
import '../utils/color.dart';

class Select extends StatelessWidget {
    static const screenId = 'select_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: KAppbarColor,
            title: Text("Blue connect"),
            actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.search),
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.more_vert),
                  ),
                )
            ],
        ),

        body: Container(
            child: Column(
                children: [
                    GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(AddGroup.screenId),
                      child: ListTile(
                          leading: CircleAvatar(child: Icon(Icons.group_add),),
                          title: Text('Create new group'),
                      ),
                    ),

                    Divider(),

                    GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(AddCommunity.screenId),
                      child: ListTile(
                          leading: CircleAvatar(child: Icon(Icons.group_work),),
                          title: Text("Create new community"),
                      ),
                    ),

                    Divider(),

                ],
            ),
        ),
    );
  }
}
