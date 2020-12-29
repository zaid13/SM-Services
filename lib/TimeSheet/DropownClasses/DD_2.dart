import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sm_service/AppScreens/Searchable_List/seacrhableListview.dart';
import 'package:sm_service/AppScreens/TimeLine/TimeLineScreen.dart';
import 'package:sm_service/App_Initialization/App_classes/BottomBar.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/PopularFilterListData.dart';
import 'package:sm_service/App_Initialization/App_classes/Tab_Icons.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';

import 'package:sm_service/DataStructures/DropDown_Master.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_1.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_2.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_3.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_4.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_5.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Updating_All_DB.dart';



class DD_2     {
    String DropDownCode;
  String DropDownValue ='Project_Code';
  bool isvisible=true;
    String DefaultVAl ='';


    final getPrjD2 = ProjectD2.instance;

    reset(lowerdrop,lowerlower){
      lowerdrop.reset(lowerlower);
      DropDownCode =null;
      DropDownValue =DefaultVAl;

    }

    getListview(context, widget,body,th) async {


      List ls = await getPrjD2.queryonlyRows_2col(

          ProjectD2.prjtypidd,   body.dropDown_timeSheet.dependentDropDown_1.DropDownCode,

          ProjectD2.empidd ,     body.dropDown_timeSheet.emp_Code.empCode_empID
      );
      if(ls.length==0)
        return;

      List <Widget> widlist = [];
      int index =0;

      ls.forEach((element) {
        index++;
        widlist.add(Container(
          color: th.bk,
          child: FlatButton(
            onPressed: () {
              widget.parent.setState(() {
                if(  body.dropDown_timeSheet.dependentDropDown_2 .  DropDownValue.toString().compareTo(   element['${ProjectD2.prjcod}'].toString())!=0)

                  reset(  body.dropDown_timeSheet.dependentDropDown_3,  body.dropDown_timeSheet.dependentDropDown_4);

                body.dropDown_timeSheet.dependentDropDown_2 .  DropDownValue =
                    element['${ProjectD2.prjcod}'].toString();

                body.dropDown_timeSheet.dependentDropDown_2 .  DropDownCode =
                    element['${ProjectD2.prjidd}'].toString();
              });
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Flexible(
                  child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(element[ProjectD2.prjcod],style: TextStyle(color: th.pr)),
                          Text(element[ProjectD2.prjds1],style: TextStyle(color: th.pr)),

                        ],
                      )
                  ),
                ),

              ],
            ),
          ),
        ));
      });

      return widlist;
    }


}

