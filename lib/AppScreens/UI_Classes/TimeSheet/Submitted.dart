
import 'package:flutter/material.dart';
import 'package:sm_service/AppScreens/Form_Screen/Absence_Request_From.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/TimeSheet/Request_Form/Request_Form.dart';

class Submitted extends StatefulWidget {
  theme thw ;
Submitted(this.thw,this.mobid);
  String mobid;

  @override
  _SubmittedState createState() => _SubmittedState();
}

class _SubmittedState extends State<Submitted> {
  @override
  Widget build(BuildContext context) {
    return RequestForm(Screen_type.Absence_Request,widget.thw,this,'');
}}
