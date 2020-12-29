


import 'package:flutter/material.dart';
import 'package:sm_service/AppScreens/Form_Screen/TopBar.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';

class About extends StatelessWidget {
  theme th ;
  About(this.th);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      backgroundColor:th.bk,
          body: Column(
        children: [
          TopBar(th,Screen_type.About),
          Expanded(child: Container(
            child: Text('SM_SERVICES',style: TextStyle(color: th.pr),),
          )),
        ],
      )),
    );
  }
}
