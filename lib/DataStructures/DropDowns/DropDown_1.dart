import 'package:flutter/material.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Server_Files/EmpMaster.dart';

class DropDown_1 {
  String DropDownCode;
  String DropDownValue = 'Select Employee';

  String calendarIDD;
  String calendarCode;
  String recidemploymaster;


  String empid;


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
      empid = map[EmpMaster.empid].toString();

    recidemploymaster = map[EmpMaster.recidd].toString();
    return recidemploymaster;
}

  setValuesby_Empid(idd) async {

    List ls = await empMaster.queryonlyRows(EmpMaster.empid, idd);

    if(ls.length==0)
      return -1;

    Map map = ls.first;

    DropDownValue = map['FirstName'] + "  " + map['LastName'];

    DropDownCode = map[EmpMaster.empcod].toString();

    calendarIDD = map[EmpMaster.Calidd].toString();
    calendarCode = map[EmpMaster.Calcod];
    recidemploymaster = map[EmpMaster.recidd].toString();
    empid = map[EmpMaster.empid].toString();

    print(recidemploymaster);
    return recidemploymaster;
  }

  setValuesby_idd(idd) async {

    List ls = await empMaster.queryonlyRows(EmpMaster.recidd, idd);

    if(ls.length==0)
      return -1;

    Map map = ls.first;

    DropDownValue = map['FirstName'] + "  " + map['LastName'];

    DropDownCode = map[EmpMaster.empcod].toString();

    calendarIDD = map[EmpMaster.Calidd].toString();
    calendarCode = map[EmpMaster.Calcod];
    recidemploymaster = map[EmpMaster.recidd].toString();
    empid = map[EmpMaster.empid].toString();

    print(recidemploymaster);
    return recidemploymaster;
  }


  setForDefault(usid) async {
    return setValuesby_RecordID(usid);
  }

  getListview(context, widget ,body,th) async {

    List ls = await empMaster.queryAllRows();
    if(ls.length==0)
      return;
    List <Widget> widlist = [];
int index =0;
    ls.forEach((element) {
      index++;

      widlist.add(Container(
        color: th.bk,
        child: FlatButton(
          onPressed: () {
            widget.parent.setState(() {
              body.dropDowns.dropDown_1.     DropDownValue = element['FirstName'] + "  " + element['LastName'];

              body.dropDowns.dropDown_1.        DropDownCode = element[EmpMaster.empcod].toString();

              body.dropDowns.dropDown_1.         calendarIDD = element[EmpMaster.Calidd].toString();
              body.dropDowns.dropDown_1.         calendarCode = element[EmpMaster.Calcod];
              body.dropDowns.dropDown_1.         recidemploymaster = element[EmpMaster.recidd].toString();
              body.dropDowns.dropDown_1. empid = element[EmpMaster.empid].toString();



            });
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10,top: 10),
            child: ListTile(

              title: Row(
mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  CircleAvatar(
//                           backgroundImage:MemoryImage(snapshot.data['pic']

                    backgroundImage: AssetImage(
                        'assets/images/userImage.png'),
                    radius: 20,
                  ),
                  Container(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(element['FirstName'] + "  " + element['LastName'],style: TextStyle(color: th.pr)),
                          Container(width: 20,),
                          Text(element['${EmpMaster.empcod}'],style: TextStyle(color: th.pr),),



                      ],),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(element['${EmpMaster.dptcod}'],style: TextStyle(color: th.pr)),
                          Container(width: 20,),
                          Text(element['${EmpMaster.poscod}'],style: TextStyle(color: th.pr)),

                        ],),




                    ],
                  ),
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
