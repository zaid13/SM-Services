import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/HourType/Hour_Type.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/Database_Files/Updating_All_DB.dart';

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
import 'package:sm_service/DataStructures/DropDown_Master.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_2.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_3.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_4.dart';
import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';
import 'package:sm_service/HTTPS_files/DB_Init_Function.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Hourly_type.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Premium_type.dart';

class Detail_Form extends StatefulWidget {

//  theme th;

Screen_type sc;
theme th ;

Detail_Form(this.sc,this.th);
  @override
  _Detail_FormState createState() => _Detail_FormState();
}

class _Detail_FormState extends State<Detail_Form> {
  List dropdown=[];
List <Widget> WidTile =[];
List <TextEditingController> comment_txt_xtrl=[];
List <TextEditingController> value_txt_xtrl=[];
int selectedindex;


  @override
  void initState() {

if(widget.sc == Screen_type.Premiums_Detail){


  dropdown.add(Premium_type());
  dropdown.add(Premium_type());
  dropdown.add(Premium_type());
  dropdown.add(Premium_type());

}
else{






  dropdown.add(Hourly_type());
  dropdown.add(Hourly_type());
  dropdown.add(Hourly_type());

}

inittextfields();


  }




  var Comentr_Controler = TextEditingController();
inittextfields(){
  for(var i in dropdown){

    comment_txt_xtrl.add(TextEditingController() );
    value_txt_xtrl.add(TextEditingController() );

  }

}





  @override
  Widget build(BuildContext context) {







    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              TopBar(widget.th, widget.sc),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context,true);
                      },
                      icon: Icon(Icons.keyboard_backspace,color: Colors.white,size: 30,),
                    ),



//
//                    Row(
//                      children: <Widget>[
//                        IconButton(
//                          icon: Icon(Icons.settings ,color: Colors.white,) ,
//                          onPressed: (){
//                            showDialog(context: context,builder: (context) => Detail_Form(Screen_type.Hours_Detail,widget.th),)  ;
//
//                          },
//                        ),
//
//
//                        Screen_type.Premiums_Detail ==widget.sc ?   IconButton(
//                          onPressed: (){
//                            showDialog(context: context,builder: (context) => Detail_Form(Screen_type.Premiums_Detail,widget.th),)  ;
//                          },
//                          icon: Icon(Icons.timer,color: Colors.white),
//
//
//                        ):Container(),
//
//
//                      ],
//                    ),



    ],
                ),
              )
            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: dropdown.length,
itemBuilder: (context, index) {
  return ListTile_Detail(index ,dropdown[index].DropDownValue.toString() ,this );



},

            ),

          ),

        ],
      ),
    );
  }



}



class ListTile_Detail extends StatelessWidget {

  ListTile_Detail(this.num,this.str,this.parent);
  int num;
  String str;
  var parent;

  @override
  Widget build(BuildContext context) {
    print(str+'++');
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Padding(
        padding:
        const EdgeInsets.only(right: 8, left: 8, bottom: 0, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(


                  padding: EdgeInsets.all(0),
                  onPressed: (){

                    parent.selectedindex = num;
                    showDialog(
                        context: context,
                        builder: (context) => Seacrable_Listview(     parent.widget.th, "Search", this ,this ,      parent.  dropdown[num] ));

                  },
                  child: Row(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: <Widget>[
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(width: 2.0, color: Hexcolor('#DAE0F9')))),
                        padding: EdgeInsets.only(bottom: 17,top: 10),

                        child:  Text(str,
                    style: TextStyle(fontSize: 17),
                  )


                ),

                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        semanticLabel: 'Delete',

                        size: 30,
                      )
                    ],
                  ),
                ),



                Container(

                  width: 100,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2.0, color: Hexcolor('#DAE0F9')))),

                  child: TextField(
                    controller:      parent.value_txt_xtrl[num],
                    decoration: InputDecoration(
                        hintText: "Hour Value"
                    ),
                    keyboardType: TextInputType.number,
                  ),

                ),

             Container(
                    child: FlatButton(
                  onPressed: (){

                    parent. setState(() {
                      parent.dropdown.removeAt(num);
                    });
                  },
                  child: Column(
                    children: <Widget>[

                      Icon(
                        Icons.delete,
                        color: Colors.grey,
                        semanticLabel: 'Delete',
                        size: 25,
                      ),
                      Text("Delete")

                    ],
                  ),
                ))
              ],
            ),
            SizedBox(height: 10,),
            TextField(
              controller:      parent.comment_txt_xtrl[num],
              decoration: InputDecoration(
                  hintText: 'Comments'
              ),

            ),
          ],
        ),
      ),
    );
  }
}

