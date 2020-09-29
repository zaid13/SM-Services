import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sm_service/Docker/navigation_home_screen.dart';
import 'package:sm_service/HTTPS_files/Authenticate_User.dart';
import 'package:sm_service/HTTPS_files/Sync_Files/Sync_Files.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) async{






    String okay =    await validateId(data.name,data.password,context);

    if(okay!=null){
      await registernewuser(data,okay);



     bool internet_conn =  await syncEvent();
      theme  th= await gettheme();


      if(!internet_conn){
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
        );

      }



      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => NavigationHomeScreen_ABSENCE(th),
      ));


      return null;

    }
    else{

      return 'Username not exists';
    }



  }

  Future<String> _recoverPassword(String name) {
    var users ={};
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }



  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      emailValidator:(String s){},
      title: 'SM Self Service',
      logo: 'assets/ecorp.png',

      onLogin: _authUser,
      onSignup: _authUser,


      theme: LoginTheme(

          titleStyle: TextStyle(fontSize: 26),

          primaryColor:Hexcolor( '#0C408A'),

          buttonTheme:LoginButtonTheme(
              backgroundColor: Hexcolor( '#0C215F'),
          ) ),

      onSubmitAnimationCompleted: () async {


        theme  th= await gettheme();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => NavigationHomeScreen_ABSENCE(th),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
