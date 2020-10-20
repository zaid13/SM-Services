import 'package:cool_alert/cool_alert.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';
import 'package:sm_service/Database_Files/Local_DB/Dark.dart';
import 'package:sm_service/HTTPS_files/Sync_Files/Delete_Files.dart';
import 'package:sm_service/HTTPS_files/Sync_Files/Sync_Files.dart';

class Settings extends StatefulWidget {
  var navigationHomeScreenState;
  final theme thw;
  Settings(this.thw,this.navigationHomeScreenState);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isAutoSync = true;
  bool isday =  true;
  bool isloading= false;

  var  th = theme();
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 1.0;
  TextEditingController syncDelayInput = TextEditingController();


  void initState() {
    if(widget.thw.bk==Day().bk){
      isday = false;
    }

    super.initState();
    th.pr= widget.thw.pr;
    th.bk= widget.thw.bk;
    th.bk= widget.thw.bk;
    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        backgroundColor: th.bk,

        body:  ModalProgressHUD(
          inAsyncCall: isloading,
          child: Column(
            children: <Widget>[



              getAppBarUI(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  child:Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView(
                      controller: scrollController,


                      children: <Widget>[

                        gettextbox  ('Autosync'),

                        textboxrow('AutoSync Delay',syncDelayInput),
                        getswithforday  ('Nigh Mode'),



                      ],
                    ),
                  ),

                ),
              ),

              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50) , topRight:Radius.circular(50)  )
                ),

                alignment: Alignment.bottomCenter,

                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(onPressed: () async {

                      setState(() {
                        isloading = true;

                      });
                      await deleteEvent();
                      setState(() {
                        isloading = false;

                      });
                      showDialog(context: context,builder:(context) {
                        return AlertDialog(
                          title: Text("Deleted"),

                        );


                      },);
                    },

                      child: Image.asset('assets/bottomicon/delete.png',height: 50,),),
                    FlatButton(onPressed: () async {

                      setState(() {
                        isloading = true;

                      });

               bool isinternet =    await AutoSync();
                      setState(() {
                        isloading = false;

                      });

                      if(!isinternet){
                          CoolAlert.show(
                            context: context,
                            type: CoolAlertType.error,
                          );


                      }
                      else{

                        CoolAlert.show(
                          context: context,
                          type: CoolAlertType.success,
                        );

                      }


                    },

                      child: Image.asset('assets/bottomicon/sync.png',height: 50,),),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget gettextbox(str) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            str,
            style: TextStyle(color: th.pr,fontSize: 20),
          ),
          CustomSwitch(
            activeColor: Colors.blue[900],
            value: isAutoSync,
            onChanged: (value) {

              if( value){
                sec5Timer();
              }
              setState(() {
                // if(value){
                //   isolate.resume();
                // }
                // else{
                //   isolate.pause();
                //
                // }

                isAuto = value;
                isAutoSync = value;
              });
            },
          ),

        ],
      ),
    );

  }
  Widget getswithforday(str) {

    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            str,
            style: TextStyle(color: th.pr,fontSize: 20),
          ),
          CustomSwitch(
            activeColor: Colors.blue[900],
            value:isday,
            onChanged: (value) async {

              Dark drk = Dark.instance;

              if(value){


                await drk.update( {"${Dark.isDark}":1}, 1)  ;

              }else{
                await drk.update( {"${Dark.isDark}":0}, 1)  ;
              }

              setState(() {

                widget.navigationHomeScreenState.setState(() {
                  if(isday)
                  {

                    widget.navigationHomeScreenState.th.pr = Day().pr ;
                    widget.navigationHomeScreenState.th.bk = Day().bk;
                    th.pr =  Day().pr ;
                    th.bk = Day().bk;


                  }

                  else

                  {

                    widget.navigationHomeScreenState.th.pr = Night().pr ;
                    widget.navigationHomeScreenState.th.bk = Night().bk;

                    th.pr =  Night().pr ;
                    th.bk = Night().bk;

                  }

                });

                isday = value;
              });
            },
          ),

        ],
      ),
    );
  }
  Widget textboxrow(str, TextEditingController txt) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 8,bottom: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child:Text(
              str,
              style: TextStyle(color: th.pr,fontSize: 20),
            ),
          ),
          Expanded(
              child: Theme(
                data: new ThemeData(
                  primaryColor: Colors.redAccent,
                  primaryColorDark: Colors.red,
                ),
                child: new TextField(

                  controller: txt,
                  style: TextStyle(color: th.pr),
                  keyboardType: TextInputType.number,
                  maxLengthEnforced: true,
                  maxLength: 4,
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: th.pr)),
                      hintText: '',
                      helperText: '',
                      labelText: '',
                      prefixIcon: const Icon(
                        Icons.timer,
                        color: Colors.grey,
                      ),
                      prefixText: ' ',
                      suffixText: 'Min',
                      suffixStyle: const TextStyle(color: Colors.grey)),
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      height: 150,
      decoration: BoxDecoration(

        border:  Border.all(
          color: th.pr,
          width: 2,
        ),
        color:  Hexcolor('#256CD0'),
//                    borderRadius: const BorderRadius.only(
//                      bottomLeft: Radius.circular(32.0),
//                    ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: FintnessAppTheme.grey
                  .withOpacity(0.4 * topBarOpacity),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[

          Expanded(
            child: Stack(
              children: <Widget>[
                Image.asset('assets/topheaderblue.png'
                  ,fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: 150
                  ,


                ),

                Positioned(
                  top:15 ,
                  left: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Settings',
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.w700,
                          fontSize: 30 ,
                          letterSpacing: 1.2,
                          color: Colors.white,

                        ),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.w100,
                          fontSize: 20 ,
                          letterSpacing: 1.2,
                          color: Colors.white,

                        ),
                      ),

                    ],
                  ),
                ),


              ],

            ),
          )
        ],
      ),
    );
  }
}

AutoSync() async {

return   await  syncEvent();


}