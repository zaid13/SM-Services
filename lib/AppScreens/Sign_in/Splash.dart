import 'package:flutter/material.dart';
import 'package:sm_service/AppScreens/Sign_in/Signin.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'dart:async';
import 'package:sm_service/Database_Files/Local_DB/SigninUser.dart';
import 'package:sm_service/Docker/navigation_home_screen.dart';

class Splash extends StatelessWidget {

  var oneTime = true;

  double height = 0.0;
  double width = 0.0;



  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    if (oneTime == true) {
      Timer(Duration(seconds: 1), () async {

        final signin  = SigninUser.instance;


        int y = await signin.queryRowCount();

        if(y==0){  //not sign in
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => LoginScreen()));
        }
        else{
          List  p = await signin.queryAllRows();
          Map mp = p.first;
          id =  mp[SigninUser.user];
          pas=  mp[SigninUser.pass];
          uid = mp[SigninUser.id];

          theme  th= await gettheme();
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => NavigationHomeScreen_ABSENCE(th)));
        }
      });

      oneTime = false;
    }

    return MaterialApp(
        home: Scaffold(
          body: Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Center(
                child: Image.asset('assets/ecorp.png'),
              )),
        ));
  }


}

