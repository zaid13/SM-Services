
import 'package:flutter/material.dart';
import 'package:sm_service/AppScreens/Form_Screen/Absence_Request_From.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/TimeSheet/Request_Form/Request_Form.dart';

class Absence_Request extends StatefulWidget {
  theme thw ;

  Absence_Request(this .thw);

  @override
  Absence_RequestState createState() => Absence_RequestState();
}

class Absence_RequestState extends State<Absence_Request> {
  @override
  Widget build(BuildContext context) {
    return RequestForm(Screen_type.Time_Sheet,widget.thw,this,'');
  }
}
