import 'dart:math';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sm_service/AppScreens/Searchable_List/seacrhableListview.dart';
import 'package:sm_service/App_Initialization/App_classes/BottomBar.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/PopularFilterListData.dart';
import 'package:sm_service/App_Initialization/App_classes/Tab_Icons.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/AppScreens/Form_Screen/TopBar.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/TimeSheetParameter.dart';
import 'package:sm_service/TimeSheet/DropownClasses/ID_2.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Emp_Code.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Positon.dart';
import 'package:sm_service/TimeSheet/DropownClasses/ID_1.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_3.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_2.dart';
import 'package:sm_service/TimeSheet/DropownClasses/DD_1.dart';
import 'package:sm_service/TimeSheet/detail/detail.dart';

class RequestForm extends StatefulWidget {

  Screen_type screentype;
  theme th;
  var parent;
  String  mobid;

  RequestForm(this.screentype,this.th,this.parent,this.mobid);



  @override
  _RequestFormState createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  theme th = theme();
  DropDown_TimeSheet dropDown_timeSheet  =DropDown_TimeSheet();
  List<TabIconData> tabIconsList;


bool  fresh=true;
  @override
  void initState() {
    th = widget.th;
    assignBottomIcon();
  }

  assignBottomIcon() {
    tabIconsList = TabIconData.tabIconsList;
    popularFilterListData.forEach((element) {
      element.isSelected = false;
    });
  }
  List<PopularFilterListData> popularFilterListData =
      PopularFilterListData.popularFList;


  var Comentr_Controler = TextEditingController();

  TextEditingController _controller1=TextEditingController();
  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        //TODO BOTTOM BAR
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {


//            RESET_SCREEN();
          },
          changeIndex: (int index) async {
//             if ((index == 0 || index == 1) && isNotselected()) {
//               return await Alert(
//                   context: context,
//                   title: "ERROR",
//                   desc: 'Select All the drop downs')
//                   .show();
//             }
//             else {
//               widget.parent.  setState(() {
//                 isloading = true;
//               });
//               if (index == 0) {
//
//                 String mobid = Random().nextInt(1000000).toString() + DateTime
//                     .now()
//                     .millisecondsSinceEpoch
//                     .toString() + dropDowns.dropDown_1.recidemploymaster.toString();
//
//                 if(startDate.isAfter(endDate)){
//                   var temp = startDate;
//                   endDate = temp;
//                   startDate = endDate;
//                 }
//
//                 insering_allDB dbvar = insering_allDB();
//                 bool perDiem = popularFilterListData[1].isSelected;
//                 await saveTolocal(dbvar, mobid, perDiem, "Saved");
//
//                 return await showDialog(
//                   context: this.context,
//                   child: new AlertDialog(
//                     content: new FlatButton(
//                       child: new Text("Saved"),
//                       onPressed: () => Navigator.pop(context, true),
//                     ),
//                   ),
//                 );
//
//
//               }
//               if (index == 1) {
//                 print("submit");
//                 print("pressed");
//
//
//                 String mobid = Random().nextInt(1000000).toString() + DateTime
//                     .now()
//                     .millisecondsSinceEpoch
//                     .toString() + dropDowns.dropDown_1.recidemploymaster.toString();
//
//                 insering_allDB dbvar = insering_allDB();
//                 bool airTick = popularFilterListData[0].isSelected;
//                 bool perDiem = popularFilterListData[1].isSelected;
//                 bool absenceSal = popularFilterListData[2].isSelected;
//                 bool AdvanceCash = popularFilterListData[3].isSelected;
//
//
//                 print(popularFilterListData[0].isSelected);
//                 print(popularFilterListData[1].isSelected);
//                 print(popularFilterListData[2].isSelected);
//                 print(popularFilterListData[3].isSelected);
//                 print("Hours" + startDate
//                     .difference(endDate)
//                     .abs()
//                     .inHours
//                     .toString());
//                 print("Min" + startDate
//                     .difference(endDate)
//                     .abs()
//                     .inMinutes
//                     .toString());
//
//                 saveTolocal(dbvar, mobid, perDiem, "ReadyToSubmit");
//
// //SAVED TO LOCAL
//
//
//                 http.Response a = await SendAbsenceRequesttoServer("", mobid);
//                 print(a.statusCode);
//
//                 print(a.body);
//
//                 if (a.body.contains('ERROR') == true) {
//                   Alert(context: context, title: "ERROR", desc: a.body).show();
//                 }
//                 else {
// //  InsertedAbsenceTransaction(mobid);
//                   Alert(context: context, title: "Submitted", desc: a.body).show();
//                   print('Inserted');
//                   Eb_prllevtrx_status eb_prllevtrx_status = Eb_prllevtrx_status
//                       .instance;
//
//                   Map ls = await InsertedAbsenceTransaction(mobid);
//                   Map d = {
//
//                     "${Absence_Transaction.recordIDD}": ls['RecordIDD'],
//                     "${Absence_Transaction.rejoiningDate}": ls['RejoiningDate'],
//                     "${Absence_Transaction
//                         .transactionNumber}": ls['TransactionNumber'],
//                     "${Absence_Transaction.LeaveCode}": ls['Leavecode'],
//                     "${Absence_Transaction.leaveTypeCode}": ls['RecordIDD'],
//                     "${Absence_Transaction.calendarDays}": ls['CalendarDays'],
//                     "${Absence_Transaction.weekendDays}": ls['WeekendDays'],
//                     "${Absence_Transaction.holidays}": ls['Holidays'],
//                     "${Absence_Transaction
//                         .EmployeeUserID}": ls['Employeeuserid'],
//                     "${Absence_Transaction
//                         .WorkflowMasterID}": ls['WorkflowMasterID'],
//                     "${Absence_Transaction
//                         .SubmittedByUserID}": ls['Submittedbyuserid'],
//                     "${Absence_Transaction.Status}": ls['Status'],
//                     "${Absence_Transaction.NumberOfDays}": ls['NumberOfDays'],
//                     "${Absence_Transaction
//                         .WorkflowMasterID}": ls['WorkflowMasterID'],
//
//
//                     "${Absence_Transaction.syncstatus}": 1,
//                     "${Absence_Transaction.syncdate}": DateTime
//                         .now()
//                         .millisecondsSinceEpoch,
//                     "${Absence_Transaction.operation}": 'Inserted',
//
//
//                   };
//                   int res = await absence_Transaction.update(
//                       Map<String, dynamic>.from(d), mobid);
//                   print("result*" + res.toString());
//                   Map statusTable = await InsertAbsenceTransactionStatus(mobid);
//
//                   dbvar.insert_Eb_prllevtrx_status(
//                       syncstatus: 1,
//                       operation: 'Inserted',
//                       syncdate: DateTime
//                           .now()
//                           .millisecondsSinceEpoch,
//                       WorkflowMasterID: statusTable['WorkflowMasterID'],
//                       mobid: mobid,
//
//
//                       Company: statusTable['Company'],
//                       cmpidd: statusTable['cmpidd'],
//                       ApprovedByUserID: statusTable['ApprovedByUserID'],
//                       approvingline: statusTable['groupcoode'],
//                       groupcode: statusTable['WorkflowMasterID'],
//                       groupidd: statusTable['groupidd'],
//                       ID: statusTable['ID'],
//                       LeaveTransactionID: statusTable['levelversion'],
//                       levelcolor: statusTable['levelcolor'],
//                       levelversion: statusTable['levelversion'],
//                       MainApproverUserID: statusTable['MainApproverUserID'],
//                       MappingType: statusTable['MappingType'],
//                       Processed: statusTable['Processed'],
//                       ProcessedDate: statusTable['ProcessedDate'],
//                       Remarks: statusTable['Remarks'],
//                       RequestStatusID: statusTable['RequestStatusID'],
//                       seq: statusTable['seq'],
//                       tag: statusTable['tag'],
//                       Transremarks: statusTable['Transremarks'],
//                       UpdateDate: statusTable['UpdateDate'],
//                       UserLevel: statusTable['UserLevel'],
//                       VoidedOnRecall: statusTable['VoidedOnRecall'],
//                       WorkflowID: statusTable['WorkflowID']
//
//
//                   );
//
//                   print('inserted');
//                   //Sync =1
//                   //o   Syncdate = current date
//                   //o   Operation = “Updated”
//
//
//                 }
//               }
//               if (index == 2) {
//                 print("attach");
//                 List<File> files = await FilePicker.getMultiFile();
//
//                 if (files != null) {
//                   print("Success picking file ");
//                 } else
//                   print("FAIlure picking file ");
//
//                 setState(() {
// //
//                 });
//
//               }
//               if (index == 3) {
//                 print("timeline");
//                 Navigator.push(context,MaterialPageRoute(builder: (context) => Absence_Timeline(),));
//               }
//
//
//               widget.parent.  setState(() {
//                 isloading = false;
//               });
//             }


          },
        ),
      ],
    );
  }
  getdatafromparameter() async {

    if(!fresh) return 1;

    fresh = false;

    _controller1.text = DateFormat('dd-MMMM-yyyy').format(DateTime.now());


    TimeSheetParameter  timeSheetParameter = TimeSheetParameter.instance;


   List ls = await timeSheetParameter.queryAllRows();
   if(ls.length==0) return 0;


Map mp = ls.last;
    dropDown_timeSheet.dependentDropDown_1.DropDownValue = mp[TimeSheetParameter.prjtypetitle];
    dropDown_timeSheet.dependentDropDown_2.DropDownValue = mp[TimeSheetParameter.prjtitle];
    dropDown_timeSheet.dependentDropDown_3.DropDownValue = mp[TimeSheetParameter.prjdtailtitle];
    dropDown_timeSheet.dependentDropDown_4.DropDownValue = mp[TimeSheetParameter.prjsbdtailtitle];
  dropDown_timeSheet.independentDropDown_1.DropDownValue = mp[TimeSheetParameter.indpndnttitle];
    dropDown_timeSheet.independentDropDown_2.DropDownValue = mp[TimeSheetParameter.indpndnt2title];


    dropDown_timeSheet.dependentDropDown_1.DefaultVAl = mp[TimeSheetParameter.prjtypetitle];
    dropDown_timeSheet.dependentDropDown_2.DefaultVAl = mp[TimeSheetParameter.prjtitle];
    dropDown_timeSheet.dependentDropDown_3.DefaultVAl = mp[TimeSheetParameter.prjdtailtitle];
    dropDown_timeSheet.dependentDropDown_4.DefaultVAl = mp[TimeSheetParameter.prjsbdtailtitle];
    dropDown_timeSheet.independentDropDown_1.DefaultVAl = mp[TimeSheetParameter.indpndnttitle];
    dropDown_timeSheet.independentDropDown_2.DefaultVAl = mp[TimeSheetParameter.indpndnt2title];


    dropDown_timeSheet.dependentDropDown_1.isvisible =    istrue(mp[TimeSheetParameter.isprjtpe    ]);
   dropDown_timeSheet.dependentDropDown_2.isvisible =    istrue(mp[TimeSheetParameter.isprjvis    ]);
    dropDown_timeSheet.dependentDropDown_3.isvisible =    istrue(mp[TimeSheetParameter.isprjdtail    ]);
   dropDown_timeSheet.dependentDropDown_4.isvisible =    istrue(mp[TimeSheetParameter.isprjsbdtail    ]);
    dropDown_timeSheet.independentDropDown_1.isvisible =    istrue(mp[TimeSheetParameter.isindpndnt    ]);
    dropDown_timeSheet.independentDropDown_2.isvisible =    istrue(mp[TimeSheetParameter.isindpndnt2    ]);


    dropDown_timeSheet.position.isvisible =   istrue(mp[TimeSheetParameter.isddlposvis    ]);

  return 1;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: th.bk,
      body: Column(
        children: <Widget>[

          Stack(
            children: <Widget>[


              TopBar(th, Screen_type.Time_Sheet),

              Positioned(
                right: 10,
                top: 30,
                child: Row(
                  children: <Widget>[


                    IconButton(
                      icon: Icon(Icons.settings ,color: Colors.white,) ,
                      onPressed: (){
                        showDialog(context: context,builder: (context) => Detail_Form(Screen_type.Hours_Detail,th),)  ;

                      },
                    ),



                    IconButton(
                      onPressed: (){
                        showDialog(context: context,builder: (context) => Detail_Form(Screen_type.Premiums_Detail,th),)  ;
                      },
                      icon: Icon(Icons.timer,color: Colors.white),


                    )

                  ],
                ),
              ),

            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: getdatafromparameter(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return ModalProgressHUD(
                    inAsyncCall: true,
                    child: Container(),
                  );

                }
                return ListView(
                  children: <Widget>[
                    formrow( dropDown_timeSheet.emp_Code.DropDownValue, () {

                      showDialog(
                          context: context,
                          builder: (context) => SizedBox(
                              width: 50,
                              height: 50,
                              child:
                              Seacrable_Listview(widget.th, "Search", this ,this ,   dropDown_timeSheet.emp_Code )));
                    }),



                    formrow(_controller1.text, () async {
    var datePicked = await DatePicker.showSimpleDatePicker(
    context,
    initialDate: DateTime(2020),
    firstDate: DateTime(2020),
    lastDate: DateTime(2024),
    dateFormat: "dd-MMMM-yyyy",
    locale: DateTimePickerLocale.en_us,
    looping: true,
    );
    setState(() {
      _controller1.text = DateFormat('dd-MMMM-yyyy').format(datePicked);


    });
    final snackBar =
    SnackBar(content: Text("Date Picked $datePicked"));
    Scaffold.of(context).showSnackBar(snackBar);
    }

                    ,icon:   Icon(
                      Icons.calendar_today,
                      color: Colors.blueAccent,
                      size: 25,
                    ),),


                    if(  dropDown_timeSheet.dependentDropDown_1.isvisible)
                    formrow(  dropDown_timeSheet.dependentDropDown_1.DropDownValue, () {

                      showDialog(
                          context: context,
                          builder: (context) => SizedBox(
                              width: 50,
                              height: 50,
                              child:
                              Seacrable_Listview(widget.th, "Search", this ,this ,     dropDown_timeSheet.dependentDropDown_1,)));


                    }),

                    if(  dropDown_timeSheet.dependentDropDown_2.isvisible)
                      formrow(    dropDown_timeSheet.dependentDropDown_2.DropDownValue, () {              showDialog(
                          context: context,
                          builder: (context) => SizedBox(
                              width: 50,
                              height: 50,
                              child:
                              Seacrable_Listview(widget.th, "Search", this ,this ,     dropDown_timeSheet.dependentDropDown_2 )));}),

                    if(  dropDown_timeSheet.dependentDropDown_3.isvisible)
                      formrow(  dropDown_timeSheet.dependentDropDown_3.DropDownValue, () {              showDialog(
                          context: context,
                          builder: (context) => SizedBox(
                              width: 50,
                              height: 50,
                              child:
                              Seacrable_Listview(widget.th, "Search", this ,this ,     dropDown_timeSheet.dependentDropDown_3 )));}),



                    if(  dropDown_timeSheet.dependentDropDown_4.isvisible)
                      formrow(  dropDown_timeSheet.dependentDropDown_4.DropDownValue, () {              showDialog(
                          context: context,
                          builder: (context) => SizedBox(
                              width: 50,
                              height: 50,
                              child:
                              Seacrable_Listview(widget.th, "Search", this ,this ,     dropDown_timeSheet.dependentDropDown_4 )));}),



                    if( dropDown_timeSheet.independentDropDown_1.isvisible)
                      formrow(   dropDown_timeSheet.independentDropDown_1.DropDownValue, () {              showDialog(
                          context: context,
                          builder: (context) => SizedBox(
                              width: 50,
                              height: 50,
                              child:
                              Seacrable_Listview(widget.th, "Search", this ,this ,    dropDown_timeSheet.independentDropDown_1 )));}),

                    if(dropDown_timeSheet.independentDropDown_2.isvisible)
                      formrow( dropDown_timeSheet.independentDropDown_2.DropDownValue, () {


                        showDialog(
                          context: context,
                          builder: (context) => SizedBox(
                              width: 50,
                              height: 50,
                              child:
                              Seacrable_Listview(widget.th, "Search", this ,this ,   dropDown_timeSheet.independentDropDown_2 )));


                      }


                              ),







                    if(dropDown_timeSheet.position.isvisible)
                    formrow(dropDown_timeSheet.position.DropDownValue, () {              showDialog(
                        context: context,
                        builder: (context) => SizedBox(
                            width: 50,
                            height: 50,
                            child:
                            Seacrable_Listview(widget.th, "Search", this ,this , dropDown_timeSheet.  position )));}),

                      textboxrow("Type your comments here", 1, TextInputType.text),

                  ],
                );
              }
            ),
          ),


          Container(
            height: MediaQuery.of(context).size.height*0.15,
              alignment: Alignment.bottomCenter, child: bottomBar()),


        ],
      ),
    );
  }

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
                  bottom: BorderSide(width: 2.0, color: Hexcolor('#DAE0F9')),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 8, left: 8, bottom: 0, top: 5),
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    fnction();
                    print("clicked press");
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

  Widget textboxrow(str, num, input) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 3),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        onTap: () {
//          checkAppPosition(i);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Expanded(
                child: Theme(
                  data: new ThemeData(
                    primaryColor: Colors.redAccent,
                    primaryColorDark: Colors.red,
                  ),
                  child: new TextField(
                    style: TextStyle(color: th.pr),
                    keyboardType: input,
                    controller:
                        num == 1 ? Comentr_Controler : TextEditingController(),
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: th.pr)),
                        hintText: str,
                        helperText: '',
                        labelText: str,
//                        prefixIcon: const Icon(
//                          Icons.person,
//                          color: Colors.green,
//                        ),
                        prefixText: ' ',
                        suffixText: '',
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
