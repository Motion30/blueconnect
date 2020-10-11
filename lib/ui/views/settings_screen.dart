import 'package:blueconnectapp/core/veiwModels/settingsview_model.dart';

import 'base_view.dart';

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
      builder: (context, model, child) => SingleChildScrollView(
        child: Container(

        ),
      ),
    );
  }
}
