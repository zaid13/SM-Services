import 'package:flutter/material.dart';
import 'package:sm_service/AppScreens/Sign_in/Splash.dart';
import 'TimeSheet/Request_Form/Request_Form.dart';
import 'package:path_provider/path_provider.dart';
void main() {
  runApp(MyApp());
}




class MyApp extends StatelessWidget {





  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}
