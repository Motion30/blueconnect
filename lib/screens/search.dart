import 'package:blueconnectapp/utils/color.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
    static const screenId = 'search_screen';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: KAppbarColor,
            title: Text("Blue connect"),
        ),
        body: Container(
            child: Column(
                children: [
                    Container(
                        color: Color(0x54FFFFFF),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                            Expanded(
                              child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Search ...",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                      )
                                  ),
                              ),
                            ),

                            Container(
                                decoration: BoxDecoration(
                                    color: KAppbarColor.withOpacity(.6),
                                    shape: BoxShape.circle,
                                ),
                              child: IconButton(
                                  color: Colors.white,
                                icon: Icon(Icons.search),
                                onPressed: () {},
                              ),
                            ),
                        ],
                      ),
                    ),
                ],
            ),
        ),
    );
  }
}
