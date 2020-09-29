import 'package:flutter/material.dart';

class List_Tile extends StatelessWidget {
  List_Tile({this.mobid , this.employeeCode,this.entryType,this.LeaveCode,this.leaveTypeCode,this.clr });
  String mobid;
  String LeaveCode ;
  String leaveTypeCode ;
  String employeeCode ;
  String entryType ;
  Color clr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
//          Text(mobid),

          tile("Employee",employeeCode ),
          tile("Leave Type",leaveTypeCode ),
          tile("Leave Code",LeaveCode ),

          tile("Entry",entryType ),


          Divider(thickness: 3,),
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