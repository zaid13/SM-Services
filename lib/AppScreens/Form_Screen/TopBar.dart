

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';

class TopBar extends StatelessWidget {
  var top;
  var height;
  theme th ;
  BuildContext uppercontext;
  var screenType;
  TopBar(this.th,this.screenType,{this.top,this.height,this.uppercontext});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
height:60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(

            color: HexColor('#2F3840'),

          ),

        ),
        Positioned(
          top: top?? 16,
          left: uppercontext!=null?0:60,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.start,

            children: <Widget>[
              Row(
mainAxisAlignment:MainAxisAlignment.start,

                children: [
                  uppercontext!=null?IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                    onPressed: (){
                      Navigator.pop(uppercontext);

                    },
                  ):Container(height: 1,width: 1,),


                  Text(
                    screenType.toString().replaceAll("Screen_type.", '').replaceAll('_', ' '),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FintnessAppTheme.fontName,
                      fontWeight: FontWeight.w700,
                      fontSize: topbarTitleSize,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ],
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
    );
  }




}
