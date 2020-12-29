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
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Updating_All_DB.dart';



class ID_1   {
  String DropDownCode;
  String DropDownValue ='Profit_Center';
  bool isvisible=true;
  String DefaultVAl ='';

  final independent_dropDown_1 = Independent_dropDown_1.instance;


  getListview(context, widget,body,th) async {


    List ls = await independent_dropDown_1.queryAllRows();
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

              body.dropDown_timeSheet.independentDropDown_1 .  DropDownValue =
                  element['${Independent_dropDown_1.code}'].toString();

              body.dropDown_timeSheet.independentDropDown_1 .  DropDownCode =
                  element['${Independent_dropDown_1.idd}'].toString();
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
                        Text(element[Independent_dropDown_1.code],style: TextStyle(color: th.pr)),
                        Text(element[Independent_dropDown_1.description],style: TextStyle(color: th.pr)),

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

