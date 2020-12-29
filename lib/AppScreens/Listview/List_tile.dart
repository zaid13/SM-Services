import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';

class List_Tile extends StatelessWidget {
  List_Tile({this.element,this.mobid ,this.trxnum, this.employeeCode,this.entryType,this.LeaveCode,this.leaveTypeCode,this.clr });
  String mobid;
  String LeaveCode ;
  String trxnum ;

  String leaveTypeCode ;
  String employeeCode ;
  String employeeName ='Employee Name'  ;

  String entryType ;
  Color clr;
  String textCol = "#2F3840";
  Map element;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
  CircleAvatar(
    backgroundImage: NetworkImage('https://www.si.edu/sites/default/files/newsdesk/photos/anonymous_silhouette.jpg'),


  ),
          Container(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
//          Text(mobid),

Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Text(employeeName,style: TextStyle(fontSize: 15,color: HexColor(blueTextcol)),),
    Text(    trxnum,style: TextStyle(fontSize: 13,color: HexColor(textCol)),),
    Text(        entryType,style: TextStyle(fontSize: 13,color: HexColor(textCol)),),
  ],
),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children: [
    Text(        leaveTypeCode,style: TextStyle(fontSize: 15,color: HexColor(blueTextcol)),),
    Text(        "ANL 30",style: TextStyle(fontSize: 13,color: HexColor(textCol)),),



  ],
),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(     DateFormat('EEE, MMM d, yy' ).format(DateTime.parse(element['${Absence_Transaction.fromDate}'])) +' - ' +DateFormat('EEE, MMM d, yy' ).format(DateTime.parse(element['${Absence_Transaction.toDate}'])), style: TextStyle(fontSize: 13,color: HexColor(textCol)),),


            ],
          ),
if(element['${Absence_Transaction.hourly}']==true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(     DateFormat('K:mm a' ).format(DateTime.parse(element['${Absence_Transaction.fromTime}'])) +' - ' +DateFormat('K:mm a' ).format(DateTime.parse(element['${Absence_Transaction.toTime}'])), style: TextStyle(fontSize: 13,color: HexColor(textCol)),),


                  ],
                ),



                // tile("Employee",employeeCode + "  "+ employeeCode),
                // // tile("Transaction #",trxnum),
                //
                // tile("Leave Type",leaveTypeCode ),
                // tile("Leave Code",LeaveCode ),
                //
                // tile("Entry",entryType ),


                Divider(thickness: 3,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  tile(name,val){

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(name,style: TextStyle(fontSize: 15,color: clr),),
//        Container(width: 10,),
        Container(
            margin: EdgeInsets.only(left:double.parse((100-name.toString().length).toString()) ),
            alignment: Alignment.centerRight,
            child: Text(val,style: TextStyle(fontSize: 18,color: clr),)),
      ],
    );

  }
}