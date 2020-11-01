import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:file_picker/file_picker.dart';
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
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Updating_All_DB.dart';




class Position     {


  String DropDownCode;
  String DropDownValue ='Position';
  bool isvisible=true;

  String DefaultVAl ='Position';

  getListview(context, widget,body) async {


//    List ls = await employeeAbsenceCodeAssignment.queryonlyRowsIFANDONLYIF(
//        EmployeeAbsenceCodeAssignment.emplevidd,
//        body.dropDowns.dropDown_1 . recidemploymaster,
//        EmployeeAbsenceCodeAssignment.lvtidd,
//        body.dropDowns.dropDown_2 . emprecidlvtidd2Forfilter4);
//    if(ls.length==0)
    return;

    List <Widget> widlist = [];
    int index =0;

//    ls.forEach((element) {
//      index++;
//      widlist.add(Container(
//        color: index % 2==0 ?Colors.white:Colors.transparent,
//        child: FlatButton(
//          onPressed: () {
////            widget.parent.setState(() {
////
////              body.dropDowns.dropDown_3 .  DropDownValue =
////                  ls.first['${EmployeeAbsenceCodeAssignment.lvccod}'].toString();
////
////              body.dropDowns.dropDown_3 .    emplcodeval =
////                  ls.first['${EmployeeAbsenceCodeAssignment.recidd}'].toString();
////            });
//            Navigator.pop(context);
//          },
//          child: Row(
//            children: [
//              Flexible(
//                child: ListTile(
//                    title: Text('element[EmployeeAbsenceCodeAssignment.lvccod]')
//                ),
//              ),
//
//            ],
//          ),
//        ),
//      ));
//    });

    return widlist;
  }

}

