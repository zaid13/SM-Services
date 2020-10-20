

import 'package:flutter/material.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sm_service/AppScreens/Dash_Board/Dash_Board_Screen.dart';
import 'package:sm_service/AppScreens/Listview/ListView.dart';
import 'package:sm_service/AppScreens/Settings/Settings_screen.dart';
import 'package:sm_service/AppScreens/UI_Classes/Absence/Absence_Request.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sm_service/Database_Files/Local_DB/Menu.dart';
import 'package:sm_service/Docker/drawer_user_controller.dart';
import 'package:sm_service/Docker/home_drawer.dart';
import 'package:sm_service/TimeSheet/Request_Form/Request_Form.dart';


class NavigationHomeScreen_ABSENCE extends StatefulWidget {
 final theme thw ;
 NavigationHomeScreen_ABSENCE(this.thw);

  @override
  NavigationHomeScreen_ABSENCEState createState() => NavigationHomeScreen_ABSENCEState();
}

class NavigationHomeScreen_ABSENCEState extends State<NavigationHomeScreen_ABSENCE> {



  getboolabsencerequest()async{
     // isolate = await FlutterIsolate.spawn(isolate1, "hello");
     sec5Timer();

     Menu menu = Menu.instance;


    List lt = await menu.queryAllRows();
    if(lt==null){
      return false;
    }
    if(lt.length==0){
      return false;
    }



    Map mp =  lt.first;


    if(mp==null){return false;}



    if(mp[Menu.name].toString().compareTo('Absence Request')==0){
      return true;
    }
    return false;
  }


  Widget screenView;
  DrawerIndex drawerIndex;
  theme th = theme();
  @override

  void initState() {
th = widget.thw;

    drawerIndex = DrawerIndex.dashboard;
    screenView = FutureBuilder(
      future: getboolabsencerequest(),
      builder: (context, snapshot) {
        if(snapshot.hasData)
        return DashBoardWrapper(th,snapshot.data);
    else{

      return ModalProgressHUD(inAsyncCall: true,child: Container(),);
        }
      }
    );
    super.initState();
  }
@override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {



    void changeIndex(DrawerIndex drawerIndexdata  , bool showabsence) {

      if (drawerIndex != drawerIndexdata) {
        drawerIndex = drawerIndexdata;
        if (drawerIndex == DrawerIndex.dashboard) {
          setState(() {
            screenView =  DashBoardWrapper(th,showabsence);
          });
        } else if (drawerIndex == DrawerIndex.absence) {

        }
        else if(drawerIndex == DrawerIndex.absencerequest)
        {
          setState(() {
            screenView = Absence_Request(th);
          });


        }
        else if(drawerIndex == DrawerIndex.savedrequest)
        {
          setState(() {
//          screenView = Absence_request_qropper();7
            screenView  = List_view(Screen_type.Saved_Request , th);    //Edit THISz  List_view

          });


        }

        else if (drawerIndex == DrawerIndex.submittedrequest) {
          setState(() {
            screenView  = List_view(Screen_type.Submitted_Request , th);    //Edit THISz  List_view
          });
        }

        else if (drawerIndex == DrawerIndex.settings) {

          setState(() {
            screenView = Settings(th,this);
          });
        }

        else if (drawerIndex == DrawerIndex.about) {
          setState(() {

          });
        }

        else if (drawerIndex == DrawerIndex.pending) {
          setState(() {
            screenView  = List_view(Screen_type.Pending_Request , th);    //Edit THISz  List_view
          });
        }


        else if (drawerIndex == DrawerIndex.Request_timesheet) {
          setState(() {
            screenView  = RequestForm(Screen_type.Request_timesheet , th ,this ,'');    //Edit THISz  List_view
          });
        }
        else if (drawerIndex == DrawerIndex.Pending_timesheet) {
          setState(() {
            screenView  = List_view(Screen_type.Pending_timesheet , th);    //Edit THISz  List_view
          });
        }
        else if (drawerIndex == DrawerIndex.Submitted_timesheet) {
          setState(() {
            screenView  = List_view(Screen_type.Submitted_timesheet , th);    //Edit THISz  List_view
          });
        }



        else if (drawerIndex == DrawerIndex.Saved_timesheet) {
          setState(() {
            screenView  = List_view(Screen_type.Saved_timesheet , th);    //Edit THISz  List_view
          });
        }

      }
    }



  return Container(
  color: AppTheme.nearlyWhite,
    child: SafeArea(
    top: false,
    bottom: false,
    child: Scaffold(


    body:StatefulBuilder(builder:(context, setState) {
      setState((){
        th = th;
      });
      return FutureBuilder(
        future: getboolabsencerequest() ,
        builder: (context, snapshot) {
          if(snapshot.hasData)
          return DrawerUserController(
            th,
            snapshot.data,
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.90,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata ,snapshot.data);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          );
        else{
          return ModalProgressHUD(inAsyncCall: true, child:Container());
          }
        }
      );


    }  ,),
    ),
    ),
    );


  }


}
