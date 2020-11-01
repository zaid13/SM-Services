import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/AppScreens/Searchable_List/seacrhableListview.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/HourType/Hour_Type.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/PremiumType/PremiumType_db.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Hour.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Hour_Premium.dart';
import 'package:sm_service/Database_Files/Local_DB/Time_sheet/Submenu_localDB/Timesheet_Premium.dart';
import 'package:sm_service/AppScreens/Form_Screen/TopBar.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Hourly_type.dart';
import 'package:sm_service/TimeSheet/DropownClasses/Premium_type.dart';
import 'package:sm_service/TimeSheet/searchableListview/SearchablelistviewSubTYpe.dart';

class Detail_Form extends StatefulWidget {
  Screen_type sc;
  theme th;
String formId;

   Detail_Form(this.sc, this.th, this.formId, {this.hrtid});
var hrtid;
  @override
  _Detail_FormState createState() => _Detail_FormState();
}

class _Detail_FormState extends State<Detail_Form> {
  List dropdown = [];
  List<Widget> WidTile = [];
  List<TextEditingController> comment_txt_xtrl = [];
  List<TextEditingController> value_txt_xtrl = [];
  int selectedindex;
  Premium_type_db premium_type_db = Premium_type_db.instance;
  HourTypes hourTypes = HourTypes.instance;
  bool first = true;

  @override
  void initState() {}

  addtiles() async {
    if (!first) return 1;

    first = false;
    dropdown.clear();

    if (widget.sc == Screen_type.Premium_) {
      Timesheet_Premium timesheet_premium = Timesheet_Premium.instance;

      List locallist = await timesheet_premium.queryonlyRows( widget.formId,Timesheet_Premium.mobid );
      int number = locallist.length;

      if (number > 0) {
        List val=[];
        List comm=[];

        locallist.forEach((element) {
          dropdown.add(Premium_type(

              element['${Timesheet_Premium.prtcod}'],
              element['${Timesheet_Premium.ptdesc}'],
              element['${Timesheet_Premium.prtcod}'],
              element['${Timesheet_Premium.prtidd}'],
              element['${Timesheet_Premium.prtval}']));
        });
        inittextfields();
        return 1;
      }
      List ls = await premium_type_db.queryonlyRows('1', Premium_type_db.type);

      ls.forEach((element) {
        dropdown.add(Premium_type(
            element['${Premium_type_db.premtype}'], "", "",             element['${Premium_type_db.recidd}'].toString(), ""));
      });
    }
    else if (widget.sc == Screen_type.Hour_) {
      Timesheet_Hour timesheet_hour = Timesheet_Hour.instance;

      List locallist = await timesheet_hour.queryonlyRows(widget.formId, Timesheet_Hour.mobid);


      int number = locallist.length;
      if (number > 0) {
        locallist.forEach((element) {
          dropdown.add(Hourly_type(
              element['${Timesheet_Hour.hrclscod}'],
              element['${Timesheet_Hour.htdesc}'],
              element['${Timesheet_Hour.hrclscod}'],
              element['${Timesheet_Hour.hrclsidd}'],
              element['${Timesheet_Hour.hours}']));
        });
        inittextfields();
        return 1;
      } else {}

      List ls = await hourTypes.queryAllRows();


      ls.forEach((element) {
      print(element);

        dropdown.add(Hourly_type(element[HourTypes.hourtypecode], "", "",element[HourTypes.hrtidd].toString(), ""));
      });
    } 
    else {

      Timesheet_Hour_Premium timesheet_hour_premium =
          Timesheet_Hour_Premium.instance;


      List locallist = await timesheet_hour_premium.queryonlyRows(widget.formId, Timesheet_Hour_Premium.hrtdidd );
      int number = locallist.length;

      if (number > 0) {

        locallist.forEach((element) {
          dropdown.add(Premium_type(
              element['${Timesheet_Hour_Premium.prtcod}'],
              element['${Timesheet_Hour_Premium.ptdesc}'],
              element['${Timesheet_Hour_Premium.prtcod}'],
              element['${Timesheet_Hour_Premium.prtidd}'],
              element['${Timesheet_Hour_Premium.prtval}']));
        });
        inittextfields();
        return 1;
      }

      List ls = await premium_type_db.queryonlyRows('2', Premium_type_db.type);

      ls.forEach((element) {
        dropdown.add(Premium_type(
            element['${Premium_type_db.premtype}'], "", "",             element['${Premium_type_db.recidd}'].toString(), ""));

      });
    }

    inittextfields();

    return 1;
  }


  inittextfields() {

if(widget.sc==Screen_type.Hour_){
  for (var i in dropdown) {
    comment_txt_xtrl.add(TextEditingController(text:     i.ptdesc));
    value_txt_xtrl.add(TextEditingController(text:   i.Prtval));

  }

}else if(widget.sc==Screen_type.Premium_){

  for (var i in dropdown) {

    value_txt_xtrl.add(TextEditingController(text:     i.Prtval));
    comment_txt_xtrl  .add(TextEditingController(text:   i.ptdesc));
  }

}
else if(widget.sc==Screen_type.Hour_Premium){

  for (var i in dropdown) {

    value_txt_xtrl.add(TextEditingController(text:     i.Prtval));
    comment_txt_xtrl  .add(TextEditingController(text:   i.ptdesc));
  }
}

  }

  updateLocalDB() async {
    insering_allDB insertdb = insering_allDB();

    Timesheet_Hour timesheet_hour = Timesheet_Hour.instance;
    Timesheet_Premium timesheet_premium = Timesheet_Premium.instance;
    Timesheet_Hour_Premium timesheet_hour_premium =
        Timesheet_Hour_Premium.instance;

    if (Screen_type.Hour_ == widget.sc) 
    {
      int counter = 0;
      List demo =await  timesheet_hour.queryAllRows();
      print(widget.formId);
      demo.forEach((element) {
        print(element);
      });

      await timesheet_hour.deleteonly( widget.formId, Timesheet_Hour.mobid   );

      dropdown.forEach((element) {
        insertdb.insering_timesheet_hour_db(
          mobid: widget.formId+'-'+counter.toString() ,
            hours: value_txt_xtrl[counter].text,
            Company: "",
            cmpidd: "0",
            hrclscod: element.DropDownValue,
            hrclsidd: element.DropDownCode,
            htdesc: comment_txt_xtrl[counter].text,
            isdeleted: "0",
            mrecidd: "0",
            recidd: "0");
        counter++;
      });
    }
    else if (Screen_type.Premium_ == widget.sc) {
      int counter = 0;

      await timesheet_premium.deleteall();

      dropdown.forEach((element) {
        insertdb.insering_timesheet_premium_db(
            mobid: widget.formId+'-'+counter.toString() ,
     ptdesc: comment_txt_xtrl[counter].text,
            prtval: value_txt_xtrl[counter].text,
            prtidd: element.DropDownCode,
            prtcod: element.DropDownValue,
            Company: "",
            cmpidd: "0",
            isdeleted: "",
            mrecidd: "0",
            recidd: "");
        counter++;
      });
    }
    else {
      await timesheet_hour_premium.deleteonly(widget.hrtid, Timesheet_Hour_Premium.hrtdidd );

      int counter = 0;
      dropdown.forEach((element) {

        insertdb.insering_Timesheet_Hour_Premium_db(
          mobid: widget.formId+'-'+counter.toString(),
          hrtdidd: widget.hrtid,
          prtcod: element.DropDownValue,
          prtidd: element.DropDownCode,
          ptdesc: comment_txt_xtrl[counter].text,
          prtval: value_txt_xtrl[counter].text,
          Company: "",
          cmpidd: "0",
          isdeleted: "0",
          mrecidd: "0",
          recidd: "0",
        );
        counter++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              TopBar(widget.th, widget.sc),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () async {


                      showAlert(BuildContext context) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Alert Dialog Title Text.'),
                              content: Text("Are You Sure Want To Proceed ?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("YES"),
                                  onPressed: () {
                                    //Put your code here which you want to execute on Yes button click.
                                    Navigator.of(context).pop();
                                  },
                                ),

                                FlatButton(
                                  child: Text("NO"),
                                  onPressed: () {
                                    //Put your code here which you want to execute on No button click.
                                    Navigator.of(context).pop();
                                  },
                                ),

                                FlatButton(
                                  child: Text("CANCEL"),
                                  onPressed: () {
                                    //Put your code here which you want to execute on Cancel button click.
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }



                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Alert Dialog Title Text.'),
                              content: Text("Are You Sure Want To Proceed ?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("YES"),
                                  onPressed: () async {
                                    await updateLocalDB();
                                    //Put your code here which you want to execute on Yes button click.
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();

                                  },
                                ),

                                FlatButton(
                                  child: Text("NO"),
                                  onPressed: () {
                                    //Put your code here which you want to execute on No button click.
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();

                                  },
                                ),

                                FlatButton(
                                  child: Text("CANCEL"),
                                  onPressed: () {
                                    Navigator.of(context).pop();

                                    //Put your code here which you want to execute on Cancel button click.
                                  },
                                ),
                              ],
                            );
                          },
                        );



                    },
                    icon: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
          FutureBuilder(
              future: addtiles(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {

                  return Expanded(
                    child: ListView.builder(
                      itemCount: dropdown.length,
                      itemBuilder: (context, index) {

                        return ListTile_Detail(
                            index,
                            dropdown[index].DropDownValue.toString(),
                            this,
                            widget.sc, () {
                          showDialog(
                            context: context,
                            builder: (context) => Detail_Form(
                              Screen_type.Hour_Premium,
                              widget.th,
                              widget. formId+'-'+index.toString(),
                              hrtid:dropdown[index].Prtidd ,


                              ),
                          );
                        });
                      },
                    ),
                  );
                }

                return Container();
              }),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    if (widget.sc == Screen_type.Premium_) {
                      dropdown.add(Premium_type('Type', "", "", "", ""));
                    } else {
                      dropdown.add(Hourly_type('Type', "", "", "", ""));
                    }
                    inittextfields();
                  });
                },
                child: Icon(Icons.add)),
          )
        ],
      ),
    );
  }
}

class ListTile_Detail extends StatelessWidget {
  ListTile_Detail(this.num, this.str, this.parent, this.sc, this.fun);
  int num;
  String str;
  var parent;
  Screen_type sc;
  Function fun;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, bottom: 0, top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    parent.selectedindex = num;
                    showDialog(
                        context: context,
                        builder: (context) {
                          if(sc==Screen_type.Hour_Premium)
                            return Seacrable_ListviewForSubmenu(
                            parent.widget.th,
                            "Search",
                            this,
                            this,
                            parent.dropdown[num]);

                          return Seacrable_Listview(
                              parent.widget.th,
                              "Search",
                              this,
                              this,
                              parent.dropdown[num]);


                        }


                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 100,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2.0, color: Hexcolor('#DAE0F9')))),
                          padding: EdgeInsets.only(bottom: 17, top: 10),
                          child: Text(
                            str,
                            style: TextStyle(fontSize: 17),
                          )),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        semanticLabel: 'Delete',
                        size: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2.0, color: Hexcolor('#DAE0F9')))),
                  child: TextField(
                    controller: parent.value_txt_xtrl[num],
                    decoration: InputDecoration(hintText: "Value"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Expanded(
                  child: Container(
                      padding: EdgeInsets.all(0),
                      child: FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          parent.setState(() {
                            parent.dropdown.removeAt(num);
                          });
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.grey,
                          semanticLabel: '',
                          size: 25,
                        ),
                      )),
                ),
                sc == Screen_type.Hour_
                    ? Expanded(
                        child: FlatButton.icon(
                            padding: EdgeInsets.all(0),
                            onPressed: fun,
                            icon: Icon(Icons.settings),
                            label: Text('')),
                      )
                    : Container()
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: parent.comment_txt_xtrl[num],
              decoration: InputDecoration(hintText: 'Comments'),
            ),
          ],
        ),
      ),
    );
  }
}
