import 'package:blueconnectapp/utils/color.dart';
import 'package:flutter/material.dart';

class AddGroup extends StatefulWidget {
    static const screenId = 'add_screen';

  @override
  _AddGroupState createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {

    final formKey = GlobalKey<FormState>();

    void saveForm() async {
        if(formKey.currentState.validate()){

        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text("Add new group"),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
                key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16
                              ),
                          ),
                      ),

                      TextFormField(
                          style: TextStyle(
                              color: Colors.black87
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                      right: Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.black12
                                  )
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                      right: Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.black12
                                  ),
                              ),
                              border: InputBorder.none
                          ),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Description',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16
                              ),
                          ),
                      ),

                      TextFormField(
                          style: TextStyle(
                              color: Colors.black87
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                      right: Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.black12
                                  ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                      right: Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.black12
                                  ),
                              ),
                              border: InputBorder.none
                          ),
                      ),

                      SizedBox(height: 20,),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Capacity',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16
                              ),
                          ),
                      ),

                      TextFormField(
                          style: TextStyle(
                              color: Colors.black87
                          ),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                      right: Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.black12
                                  ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(12),
                                      right: Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                      color: Colors.black12
                                  ),
                              ),
                              border: InputBorder.none
                          ),
                      ),

                      SizedBox(height: 50,),

                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: KAppbarColor,
                              borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Icon(
                                      Icons.group_add,
                                      color: Colors.white,
                                      size: 28,
                                  ),

                                  SizedBox(width: 20,),

                                  Text(
                                      'Add Group',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18
                                      ),
                                  ),
                              ],
                          ),
                      ),
                  ],
              ),
            ),
        ),
    );
  }
}
