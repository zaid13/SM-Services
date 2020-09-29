

import 'package:flutter/material.dart';
import 'package:sm_service/Database_Files/Server_Files/AbsenceTypes.dart';
import 'package:sm_service/Database_Files/Server_Files/VacationEntryType.dart';

class DropDown_4{
  DropDown_4(this.DropDownCode);


  String DropDownCode;
  String DropDownValue ='Select Entry Type';

  String templateDropDown='Select Entry Type';


  final vacationEntryType = VacationEntryType.instance;

  setValues(newval) async {

    DropDownCode = newval;
    List ls  = await vacationEntryType.queryifandonlyif(VacationEntryType.value ,DropDownCode  );
    if(ls.length==0)
      return;
    DropDownValue= ls.first[VacationEntryType.text];
  }



  setForDefault() async {

    var vacationEntryTypelstt = await vacationEntryType.queryAllRows();
    if(vacationEntryTypelstt.length==0)
      return;
    DropDownCode = vacationEntryTypelstt.first['${VacationEntryType.value}'];
    await setValues(DropDownCode);
  }
  getListview(context, widget
      ,body) async {

    final absenceTypes = AbsenceTypes.instance;

    List absencetypesforFilter = await absenceTypes.queryAllRows();


    absencetypesforFilter = await absenceTypes.queryonlyRows(
        body.dropDowns.dropDown_2 . emprecidlvtidd2Forfilter4, AbsenceTypes.recidd);

    int encachsment;
    int adjustment;
    int planning;


    if (absencetypesforFilter[0]['${AbsenceTypes.levenc}'] == 1) {
//        print("encachsment  is allowed");
      encachsment = 2;
    } else {
      encachsment = -1;
//        print("encachsment  is NOT  allowed");
    }

    if (absencetypesforFilter[0]['${AbsenceTypes.LevadjAll}'] == 1) {
//        print("adjustment  is allowed");
      adjustment = 3;
    } else {
      adjustment = -1;
//        print("adjustment  is NOT  allowed");
    }
    if (absencetypesforFilter[0]['${AbsenceTypes.LevplnAll}'] == 1) {
//        print("planning   is allowed");
      planning = 4;
    } else {
      planning = -1;
//        print("planning   is NOT  allowed");
    }

    //todo

    List ls    = await vacationEntryType.queryonlyRows(
        1, encachsment, adjustment, planning, VacationEntryType.value);





    List <Widget> widlist = [];

    int index =0;

    ls.forEach((element) {
      index++;
      widlist.add(Container(
        color: index % 2==0 ?Colors.white:Colors.transparent,
        child: FlatButton(
          onPressed: () {
            widget.parent.setState(() {

              widget.parent.setState(() {
                body.dropDowns.dropDown_4 .     DropDownCode = element ['${VacationEntryType.value}'];
                body.dropDowns.dropDown_4 .      DropDownValue= element[VacationEntryType.text];
              });


            });
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                    title: Text(element[VacationEntryType.text])
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
