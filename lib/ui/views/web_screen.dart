import 'dart:io';
import 'package:blueconnectapp/core/veiwModels/webview_model.dart';
import 'package:blueconnectapp/ui/shared/colors.dart';
import 'base_view.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatelessWidget {
  final String url;

  const WebScreen({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WebViewModel>(
      onModelReady: (model){
        if(Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: KPrimaryColor2,
          title: Text(
            "Blue Connect",
            style: TextStyle(
              fontFamily: 'PoppinsRegular',
            ),
          ),
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
        ),
      ),
    );
  }
}
