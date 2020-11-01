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
import 'package:sm_service/DataStructures/DropDowns/DropDown_2.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_3.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_4.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_5.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/EmpMaster_timesheet.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Updating_All_DB.dart';


class Emp_Code {


  String templateDropDown = 'Select Employee';
  String DropDownCode;
  String DropDownValue = 'Select Employee';

  String calendarIDD;
  String calendarCode;
  String recidemploymaster;
  String empCode_empID;

  String DefaultVAl ='';

String empcodeForSubmission='';  //used in saved and sending data to server

  EmpMaster_Timesheet empMaster_timesheet = EmpMaster_Timesheet.instance;


  reset(lowerdrop,lower2,lower3,lower4){
    lowerdrop.reset(lower2,lower3,lower4);
    DropDownCode =null;
    DropDownValue =DefaultVAl;

  }
  setValuesby_RecordID(uid) async {
    List ls = await empMaster_timesheet.queryonlyRows(EmpMaster_Timesheet.userid, uid);

    if(ls.length==0)
      return;

    Map map = ls.first;

    DropDownValue = map['FirstName'] + "  " + map['LastName'];

    DropDownCode = map[EmpMaster_Timesheet.empcod].toString();

    calendarIDD = map[EmpMaster_Timesheet.Calidd].toString();
    calendarCode = map[EmpMaster_Timesheet.Calcod];
    empCode_empID = map[EmpMaster_Timesheet.empid].toString();
    recidemploymaster = map[EmpMaster_Timesheet.recidd].toString();


    return recidemploymaster;
  }


  setValuesby_idd(idd) async {
    List ls = await empMaster_timesheet.queryonlyRows(EmpMaster_Timesheet.recidd, idd);
    if(ls.length==0)
      return;

    Map map = ls.first;
    if(ls.length==0)
      return;
    DropDownValue = map['FirstName'] + "  " + map['LastName'];

    DropDownCode = map[EmpMaster_Timesheet.empcod].toString();

    calendarIDD = map[EmpMaster_Timesheet.Calidd].toString();
    calendarCode = map[EmpMaster_Timesheet.Calcod];
    recidemploymaster = map[EmpMaster_Timesheet.recidd].toString();
    return recidemploymaster;
  }


  setForDefault(usid) async {
    return setValuesby_RecordID(usid);
  }

  getListview(context, widget ,body) async {

    List ls = await empMaster_timesheet.queryAllRows();
    print(ls.length);

    if(ls.length==0)
      return;


    List <Widget> widlist = [];
    int index =0;
    ls.forEach((element) {
      print(element['FirstName'] + "  " + element['LastName']);

      index++;
      widlist.add(Container(
        color: index % 2==0 ?Colors.white: Day().bk,
        child: FlatButton(
          onPressed: () {
            widget.parent.setState(() {


print( '-'+ body.dropDown_timeSheet.emp_Code .  empCode_empID.toString() + '-');
print( '-'+element['${EmpMaster_Timesheet.empid}'].toString() + '-');


              if(  body.dropDown_timeSheet.emp_Code .  empCode_empID.toString().compareTo(   element['${EmpMaster_Timesheet.empcod}'].toString())!=0)
                {
                  print("reset all drop downs ");
                  reset(     body.dropDown_timeSheet.dependentDropDown_1,   body.dropDown_timeSheet.dependentDropDown_2, body.dropDown_timeSheet.dependentDropDown_3, body.dropDown_timeSheet.dependentDropDown_4);

                }
              else{
                print("NOT reset all drop downs ");


              }



              body.dropDown_timeSheet.emp_Code .  DropDownValue =
                element['${EmpMaster_Timesheet.empcod}'].toString() +'  '+
                    element['FirstName'] + "  " + element['LastName']    ;

             body.dropDown_timeSheet.emp_Code .  DropDownCode =
                element['${EmpMaster_Timesheet.recidd}'].toString();

             body.dropDown_timeSheet.emp_Code .  empCode_empID =
                         element['${EmpMaster_Timesheet.empid}'].toString();

body.dropDown_timeSheet.emp_Code . empcodeForSubmission=  element['${EmpMaster_Timesheet.empcod}'].toString();



            });


            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10,top: 10),
            child: ListTile(

              title:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(element['${EmpMaster_Timesheet.empcod}'].toString()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Text(element['FirstName'] + "  " + element['LastName']),
                      Text(element['${EmpMaster_Timesheet.dptcod}'].toString())

                    ],),
                  Text(element['${EmpMaster_Timesheet.poscod}'].toString()),

                ],
              )

//                              subtitle:  ( widget.valofrow!=3) ?Text('${widget.subarray[index] }',style: TextStyle(
//                                  color: th.pr

//                              )) : Text(''),
            ),
          ),
        ),
      ));
    });
    print("widlist");


    return widlist;
  }



}
