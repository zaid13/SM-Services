
import 'package:flutter/material.dart';
import 'package:sm_service/AppScreens/Form_Screen/Absence_Request_From.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';

class Saved extends StatefulWidget {
  theme thw ;
Saved(this.thw,this.mobid);
  String mobid;

  @override
  _SavedState createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  @override
  Widget build(BuildContext context) {
    return Absence_Request_Form(Screen_type.Saved_Request,widget.thw,this,widget.mobid);
  }
}
