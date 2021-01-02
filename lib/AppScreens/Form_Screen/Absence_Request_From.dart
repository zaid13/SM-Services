
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sm_service/AppScreens/Form_Screen/Body.dart';
import 'package:sm_service/AppScreens/Form_Screen/TopBar.dart';
import 'package:sm_service/App_Initialization/App_classes/BottomBar.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/Tab_Icons.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import'package:sm_service/DataStructures/DropDown_Master.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_2.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_3.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_4.dart';
import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/HTTPS_files/DB_Init_Function.dart';

class Absence_Request_Form extends StatefulWidget {
  Absence_Request_Form(this.screentype,this.th ,this.parent,this.mobid);
  Screen_type screentype;
  theme th;
  var parent;
  String  mobid;



  @override
  _Absence_Request_FormState createState() => _Absence_Request_FormState();
}

class _Absence_Request_FormState extends State<Absence_Request_Form> {



  bool _working = false;
@override
  void setState(fn) {
    // TODO: implement setState
  }
  @override
  Widget build(BuildContext context) {
return SafeArea(
  child:   Scaffold(
      resizeToAvoidBottomInset: false,
    backgroundColor: widget.th.bk,

    body: Container(

      height: MediaQuery.of(context).size.height,

      child: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: <Widget>[



          TopBar(widget.th,widget.screentype),

          Expanded(

            child: Absence_Body(widget.th,widget.screentype,widget.parent,widget.mobid),

          ),





        ],

      ),

    )

  ),
);

  }







}
