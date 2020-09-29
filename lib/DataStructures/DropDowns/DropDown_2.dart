

import 'package:flutter/material.dart';
import 'package:sm_service/Database_Files/Server_Files/EmpAbsenceAssignments.dart';

class DropDown_2{

  String DropDownCode;   //recid          Record ID
  String DropDownValue ='Select Absence Type';  //lvtcod   LeaveTypeCode
  String  emprecidlvtidd2Forfilter4  ;    //lvtidd     LeaveTypeid


  String templateDropDown='Select Absence Type';

  EmpAbsenceAssignments empabsAssignment = EmpAbsenceAssignments.instance;


  setValuesby_RecordID(newval) async {

    DropDownCode  = newval;
    List lstempabsAssignment = await empabsAssignment.queryonlyRows(
        DropDownCode, EmpAbsenceAssignments.recidd);




    lstempabsAssignment.forEach((element) {

      this. DropDownCode = element[EmpAbsenceAssignments.recidd].toString();
      this. DropDownValue = element[EmpAbsenceAssignments.lvtcod].toString();
      this.emprecidlvtidd2Forfilter4 =
          element[EmpAbsenceAssignments.lvtidd].toString();

    });
    return emprecidlvtidd2Forfilter4;

  }
  setValuesby_LeaveTypeid(newval) async {

    this. emprecidlvtidd2Forfilter4  = newval;
    List lstempabsAssignment = await empabsAssignment.queryonlyRows(
        emprecidlvtidd2Forfilter4, EmpAbsenceAssignments.lvtidd);




    lstempabsAssignment.forEach((element) {

      this. DropDownCode = element[EmpAbsenceAssignments.recidd].toString();
      this. DropDownValue = element[EmpAbsenceAssignments.lvtcod].toString();
      this. emprecidlvtidd2Forfilter4 =
          element[EmpAbsenceAssignments.lvtidd].toString();

    });
    return emprecidlvtidd2Forfilter4;

  }


  setForDefault(recidemploymaster) async {
    List lst  = await empabsAssignment.queryonlyRows(
        recidemploymaster, EmpAbsenceAssignments.empidd);
    if(lst.length==0)
      return;

    for (var element in lst){
      if (
      element[EmpAbsenceAssignments.defaultvalue]
          .toString()
          .compareTo('1') ==
          0) {

        this.DropDownCode = element[EmpAbsenceAssignments.recidd].toString();
        return  await setValuesby_RecordID( this.DropDownCode);
      }

    }







  }

  getListview(context, widget,body) async {



List ls =await  empabsAssignment.queryonlyRows(
    body.dropDowns.dropDown_1 . recidemploymaster, EmpAbsenceAssignments.empidd);


  List <Widget> widlist = [];
int index =0;

  ls.forEach((element) {index++;
    widlist.add(Container(
      color: index % 2==0 ?Colors.white:Colors.transparent,
      child: FlatButton(
        onPressed: () {
          widget.parent.setState(() {

            body.dropDowns.dropDown_2 . DropDownCode = element[EmpAbsenceAssignments.recidd].toString();
            body.dropDowns.dropDown_2 . DropDownValue = element[EmpAbsenceAssignments.lvtcod].toString();
            body.dropDowns.dropDown_2.emprecidlvtidd2Forfilter4 =
                element[EmpAbsenceAssignments.lvtidd].toString();


          });
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Flexible(
              child: ListTile(
                  title: Text(element[EmpAbsenceAssignments.lvtcod])
              ),
            ),
//                          Flexible(
//                            child: ListTile(
//                              title: Text('${items[index]}'),
//                              subtitle: Text('${items[index]}'),
//                            ),
//                          ),
          ],
        ),
      ),
    ));
  });

  return widlist;
}}

