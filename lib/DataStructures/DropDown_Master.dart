import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/AppScreens/Searchable_List/seacrhableListview.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_1.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_2.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_3.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_4.dart';

class Drop_Down_Master extends StatefulWidget {
  Drop_Down_Master(this.dropDowns, this.th, this.parent);
  DropDowns dropDowns;
  theme th;
  var parent;

  @override
  _Drop_Down_MasterState createState() => _Drop_Down_MasterState(th);
}

class _Drop_Down_MasterState extends State<Drop_Down_Master> {
  _Drop_Down_MasterState(this.th);
  theme th;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        getdropDown(widget.dropDowns.dropDown_1),
        getdropDown(widget.dropDowns.dropDown_2),
        getdropDown(widget.dropDowns.dropDown_3),
        getdropDown(widget.dropDowns.dropDown_4),
      ],
    );
  }

  getdropDown(DropDown) {
    if (DropDown.runtimeType == DropDown_1) {
      return formrow(widget.dropDowns.dropDown_1.DropDownValue, () {
        showDialog(
            context: context,
            builder: (context) => Seacrable_Listview(
                    th,
                widget.dropDowns.dropDown_1.templateDropDown,
                this,
                widget.parent,widget.dropDowns.dropDown_1));
      });
    }
    if (DropDown.runtimeType == DropDown_2) {
      return formrow(widget.dropDowns.dropDown_2.DropDownValue, () {
        showDialog(
            context: context,
            builder: (context) => Seacrable_Listview(
                th,
                widget.dropDowns.dropDown_2.templateDropDown,
                this,
                widget.parent,widget.dropDowns.dropDown_2));
      });
    }
    if (DropDown.runtimeType == DropDown_3) {
      return formrow(widget.dropDowns.dropDown_3.DropDownValue, () {
        showDialog(
            context: context,
            builder: (context) => Seacrable_Listview(
                th,
                widget.dropDowns.dropDown_3.templateDropDown,
                this,
                widget.parent,widget.dropDowns.dropDown_3));
      });
    }
    if (DropDown.runtimeType == DropDown_4) {
      return formrow(widget.dropDowns.dropDown_4.DropDownValue, () {
        showDialog(
            context: context,
            builder: (context) => Seacrable_Listview(
                th,
                widget.dropDowns.dropDown_4.templateDropDown,
                this,
                widget.parent,widget.dropDowns.dropDown_4));
      });
    }
  }

//  Widget formrow(valuestr, Function fnction) {
//    return Padding(
//      padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 3),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Expanded(
//            child: FlatButton(
//
//              padding: EdgeInsets.all(0),
//              onPressed: () {
//                fnction();
//
//
//              },
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.end,
//                children: [
//                  Expanded(
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(
//                        valuestr ?? '',
//                        style: TextStyle(
//                          color: th.pr,
//                        ),
//                      ),
//                    ),
//                  ),
//                  Icon(
//                    Icons.keyboard_arrow_down,
//                    color: th.pr,
//                  ),
//                ],
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
  Widget formrow(valuestr, Function fnction,{icon}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.0, color: HexColor('#DAE0F9')),
                ),
              ),
              child: Padding(
                padding:
                const EdgeInsets.only(right: 8, left: 8, bottom: 0, top: 5),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    fnction();

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          valuestr ?? '',
                          style: GoogleFonts.roboto(
                            color: th.pr,
                            fontStyle: FontStyle.normal,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      icon??
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.blueAccent,
                            size: 25,
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
