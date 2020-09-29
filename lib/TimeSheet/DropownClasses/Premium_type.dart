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
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Get_project_dropdown/ProjectD2.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Independent_Dropdowns/Independent_dropDown_1.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/PremiumType/PremiumType_db.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Updating_All_DB.dart';

class Premium_type     {
  String DropDownCode;
  String DropDownValue ='Premium_type';

  bool isvisible=true;

  final getPrjD1 = Premium_type_db.instance;



  getListview(context, widget,body) async {


    List ls = await getPrjD1.queryAllRows();
    if(ls.length==0)
      return;

    List <Widget> widlist = [];
    int index =0;

    ls.forEach((element) {
      print(element);
      index++;
      widlist.add(Container(
        color: index % 2==0 ?Colors.white:Colors.transparent,
        child: FlatButton(
          onPressed: () {


            widget.parent.parent.setState(() {
                body.parent.dropdown [   body.parent.selectedindex  ].   DropDownValue =
                  element['${Premium_type_db.premtype}'].toString();

              body.parent.dropdown [     body.parent.selectedindex].   DropDownCode =

                  element['${Premium_type_db.recidd}'].toString();
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
                        Text(element[Premium_type_db.premtype]),
                        Text(element[Premium_type_db.premtypedescription]),

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
