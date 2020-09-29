
import 'package:flutter/material.dart';
import 'package:sm_service/AppScreens/Form_Screen/Absence_Request_From.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/TimeSheet/Request_Form/Request_Form.dart';

class Pending extends StatefulWidget {
  theme thw ;
Pending(this.thw,this.mobid);
String mobid;


  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    return RequestForm(Screen_type.Absence_Request,widget.thw,this,'');
  }
}
