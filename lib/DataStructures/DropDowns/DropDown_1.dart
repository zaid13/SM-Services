import 'package:flutter/material.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Server_Files/EmpMaster.dart';

class DropDown_1 {
  String DropDownCode;
  String DropDownValue = 'Select Employee';

  String calendarIDD;
  String calendarCode;
  String recidemploymaster;

  String templateDropDown = 'Select Employee';

  EmpMaster empMaster = EmpMaster.instance;

  setValuesby_RecordID(uid) async {
    List ls = await empMaster.queryonlyRows(EmpMaster.userid, uid);

    if(ls.length==0)
      return;

    Map map = ls.first;

    DropDownValue = map['FirstName'] + "  " + map['LastName'];

    DropDownCode = map[EmpMaster.empcod].toString();

    calendarIDD = map[EmpMaster.Calidd].toString();
    calendarCode = map[EmpMaster.Calcod];
    recidemploymaster = map[EmpMaster.recidd].toString();
    return recidemploymaster;
}


  setValuesby_idd(idd) async {
    List ls = await empMaster.queryonlyRows(EmpMaster.recidd, idd);
    if(ls.length==0)
      return;

    Map map = ls.first;
    if(ls.length==0)
      return;
    DropDownValue = map['FirstName'] + "  " + map['LastName'];

    DropDownCode = map[EmpMaster.empcod].toString();

    calendarIDD = map[EmpMaster.Calidd].toString();
    calendarCode = map[EmpMaster.Calcod];
    recidemploymaster = map[EmpMaster.recidd].toString();
    return recidemploymaster;
  }


  setForDefault(usid) async {
    return setValuesby_RecordID(usid);
  }

  getListview(context, widget ,body) async {

    List ls = await empMaster.queryAllRows();
    if(ls.length==0)
      return;
    List <Widget> widlist = [];
int index =0;
    ls.forEach((element) {
      index++;
      widlist.add(Container(
        color: index % 2==0 ?Colors.white:Colors.transparent,
        child: FlatButton(
          onPressed: () {
            widget.parent.setState(() {
              body.dropDowns.dropDown_1.     DropDownValue = element['FirstName'] + "  " + element['LastName'];

              body.dropDowns.dropDown_1.        DropDownCode = element[EmpMaster.empcod].toString();

              body.dropDowns.dropDown_1.         calendarIDD = element[EmpMaster.Calidd].toString();
              body.dropDowns.dropDown_1.         calendarCode = element[EmpMaster.Calcod];
              body.dropDowns.dropDown_1.         recidemploymaster = element[EmpMaster.recidd].toString();




            });
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10,top: 10),
            child: ListTile(

              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(element['${EmpMaster.empcod}']),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                    Text(element['FirstName'] + "  " + element['LastName']),
                    Text(element['${EmpMaster.dptcod}'])

                  ],),
                  Text(element['${EmpMaster.poscod}']),

                ],
              ),

//                              subtitle:  ( widget.valofrow!=3) ?Text('${widget.subarray[index] }',style: TextStyle(
//                                  color: th.pr

//                              )) : Text(''),
            ),
          ),
        ),
      ));
    });

    return widlist;
  }}
