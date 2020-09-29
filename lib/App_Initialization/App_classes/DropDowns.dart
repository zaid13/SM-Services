


import 'package:sm_service/DataStructures/DropDowns/DropDown_1.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_2.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_3.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_4.dart';
import 'package:sm_service/DataStructures/DropDowns/DropDown_5.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_4.dart';
import 'package:sm_service/TimeSheet/DropownClasses/ID_2.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Emp_Code.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Positon.dart';
import 'package:sm_service/TimeSheet/DropownClasses/ID_1.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_3.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_2.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_1.dart';

class DropDowns{
  DropDowns(this.dropDown_1,this.dropDown_2,this.dropDown_3,this.dropDown_4,this.dropDown_5);
DropDown_1 dropDown_1;
DropDown_2 dropDown_2;
DropDown_3 dropDown_3;
DropDown_4 dropDown_4;
DropDown_5 dropDown_5;



}
class DropDown_TimeSheet{

  DropDown_TimeSheet(


      );


  Emp_Code emp_Code = Emp_Code();


  DD_1 dependentDropDown_1 = DD_1();
  DD_2 dependentDropDown_2 = DD_2();
  DD_3 dependentDropDown_3 = DD_3();
  DD_4 dependentDropDown_4 = DD_4();


  ID_1 independentDropDown_1 = ID_1();
  ID_2 independentDropDown_2  = ID_2();

  Position position = Position();

}