

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';

class TopBar extends StatelessWidget {
  theme th ;
  var screenType;
  TopBar(this.th,this.screenType);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: th.pr,
          width: 2,
        ),
        color: Hexcolor('#256CD0'),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: FintnessAppTheme.grey.withOpacity(0.4 ),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/topheaderblue.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                ),
                Positioned(
                  top: 60,
                  left: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        screenType.toString().replaceAll("Screen_type.", '').replaceAll('_', ' '),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          letterSpacing: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
                          letterSpacing: 1.2,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }




}
