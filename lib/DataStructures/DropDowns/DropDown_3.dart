

import 'package:flutter/material.dart';
import 'package:sm_service/Database_Files/Server_Files/EmployeeAbsenceCodeAssignment.dart';

class DropDown_3{

  String DropDownCode;   //Leave Code ID    __ lvccid
  String DropDownValue = 'Select Absence Code';
  String emplcodeval ;   // Record ID   __ recid

  String templateDropDown='Select Absence Code';


  EmployeeAbsenceCodeAssignment employeeAbsenceCodeAssignment   = EmployeeAbsenceCodeAssignment.instance;
  
  setValuesby_LeaveCodeID(newid) async {

    DropDownCode = newid;

   List ls = await employeeAbsenceCodeAssignment.queryonlyRows(  EmployeeAbsenceCodeAssignment.lvcidd,DropDownCode);
    if(ls.length==0)
      return;
   DropDownValue =
      ls.first['${EmployeeAbsenceCodeAssignment.lvccod}'].toString();

    emplcodeval =
      ls.first['${EmployeeAbsenceCodeAssignment.recidd}'].toString();
  
  
}


  setValuesby_RecordID(newid) async {
    emplcodeval= newid;
    List ls = await  employeeAbsenceCodeAssignment.queryonlyRows(  EmployeeAbsenceCodeAssignment.recidd,emplcodeval) ;
    if(ls.length==0)
      return;
    DropDownValue =
        ls.first['${EmployeeAbsenceCodeAssignment.lvccod}'].toString();
    DropDownCode =
        ls.first['${EmployeeAbsenceCodeAssignment.lvcidd}'].toString();



  }




  setForDefault(recidemploymaster, emprecidlvtidd2Forfilter4) async {

    List lstabscodeasg =
        await employeeAbsenceCodeAssignment.queryonlyRowsIFANDONLYIF(
        EmployeeAbsenceCodeAssignment.emplevidd,
        recidemploymaster,
        EmployeeAbsenceCodeAssignment.lvtidd,
        emprecidlvtidd2Forfilter4);


    lstabscodeasg.forEach((element) {
      Map mp = element;
      mp.forEach((key, value) async {

        if (
            element[EmployeeAbsenceCodeAssignment.defaultvalue]
                .toString()
                .compareTo('1') ==
                0) {
        DropDownCode =
              element['${EmployeeAbsenceCodeAssignment.lvcidd}'].toString();
        await  setValuesby_LeaveCodeID(DropDownCode);

        }
      });
    });

  }
  getListview(context, widget,body) async {


  List ls = await employeeAbsenceCodeAssignment.queryonlyRowsIFANDONLYIF(
  EmployeeAbsenceCodeAssignment.emplevidd,
  body.dropDowns.dropDown_1 . recidemploymaster,
  EmployeeAbsenceCodeAssignment.lvtidd,
  body.dropDowns.dropDown_2 . emprecidlvtidd2Forfilter4);
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

  body.dropDowns.dropDown_3 .  DropDownValue =
  ls.first['${EmployeeAbsenceCodeAssignment.lvccod}'].toString();

  body.dropDowns.dropDown_3 .    emplcodeval =
  ls.first['${EmployeeAbsenceCodeAssignment.recidd}'].toString();
  });
  Navigator.pop(context);
  },
  child: Row(
  children: [
  Flexible(
  child: ListTile(
  title: Text(element[EmployeeAbsenceCodeAssignment.lvccod])
  ),
  ),

  ],
  ),
  ),
  ));
  });

  return widlist;
}


}
