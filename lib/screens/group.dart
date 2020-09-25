import 'package:flutter/material.dart';

class Group extends StatelessWidget {
    static const screenId = 'group_screen';

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            CircleAvatar(backgroundColor: Colors.white70,),
                            SizedBox(width: 10,),
                            Text("Group Name")
                        ],
                    ),
                ),
                actions: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: IconButton(
                            onPressed: (){},
                            icon: Icon(
                                Icons.search
                            ),
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: IconButton(
                            onPressed: (){},
                            icon: Icon(
                                Icons.more_vert
                            ),
                        ),
                    )
                ],
            ),
            body: Container(
                child: Center(
                    child: Text(
                        "Group Chat Screen"
                    ),
                ),
            ),
        );
    }
}
