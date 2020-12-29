import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/AppScreens/Sign_in/Splash.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Local_DB/SigninUser.dart';
import 'package:sm_service/Database_Files/Server_Files/EmpMaster.dart';

class HomeDrawer extends StatefulWidget {
  final theme thw;

  HomeDrawer(this.thw, this.showabsencerequest, this.showtimeline,
      {Key key,
      this.drawerUserControllerState,
      this.screenIndex,
      this.iconAnimationController,
      this.callBackIndex})
      : super(key: key);
  final bool showabsencerequest;
  final bool showtimeline;

  final drawerUserControllerState;
  final AnimationController iconAnimationController;
  final DrawerIndex screenIndex;
  final Function(DrawerIndex) callBackIndex;

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  List<DrawerList> drawerList;
  bool absence = false;
  bool timeline = false;

  theme th = theme();

  @override
  void initState() {
    th = widget.thw;

    if (th.pr == Day().pr) {
    } else {}

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.dashboard,
        labelName: 'Dashboard',
        icon: Icon(
          Icons.home,
          color: th.pr,
        ),
        home_screen: this,
        isSub: false,
      ),
      if (widget.showabsencerequest)
        DrawerList(
          index: DrawerIndex.absence,
          labelName: 'Absence',
          isAssetsImage: true,
          imageName: 'assets/images/supportIcon.png',
          isabsence: true,
          home_screen: this,
          isSub: false,
          endicon: absence == true
              ? Icon(Icons.keyboard_arrow_up, color: th.pr)
              : Icon(Icons.keyboard_arrow_down, color: th.pr),
        ),
      if (absence  && widget.showabsencerequest)
        DrawerList(
          index: DrawerIndex.absencerequest,
          labelName: 'Absence Request',
          icon: Icon(Icons.mode_edit, color: th.pr),
          isSub: true,
        ),
      if (absence  && widget.showabsencerequest)
        DrawerList(
          index: DrawerIndex.savedrequest,
          labelName: 'Saved Requests',
          icon: Icon(Icons.save, color: th.pr),
          isSub: true,
        ),
      if (absence  && widget.showabsencerequest)
        DrawerList(
          index: DrawerIndex.submittedrequest,
          labelName: 'Submitted Requests',
          icon: Icon(Icons.done, color: th.pr),
          isSub: true,
        ),
      if (absence && widget.showabsencerequest)
        DrawerList(
          index: DrawerIndex.pending,
          labelName: 'Pending Requests',
          icon: Icon(Icons.access_time, color: th.pr),
          isSub: true,
        ),

      if (widget.showtimeline)
        DrawerList(
          index: DrawerIndex.timesheet,
          labelName: 'TimeSheet',
          isAssetsImage: true,
          imageName: 'assets/images/supportIcon.png',
          isabsence: true,
          home_screen: this,
          isSub: false,
          endicon: timeline == true
              ? Icon(Icons.keyboard_arrow_up, color: th.pr)
              : Icon(Icons.keyboard_arrow_down, color: th.pr),
        ),
      if (timeline  && widget.showtimeline)
        DrawerList(
          index: DrawerIndex.Request_timesheet,
          labelName: 'Time Sheet',
          icon: Icon(Icons.mode_edit, color: th.pr),
          isSub: true,
        ),
      if (timeline  && widget.showtimeline)
        DrawerList(
          index: DrawerIndex.Saved_timesheet,
          labelName: 'Saved Requests',
          icon: Icon(Icons.save, color: th.pr),
          isSub: true,
        ),
      if (timeline  && widget.showtimeline)
        DrawerList(
          index: DrawerIndex.Submitted_timesheet,
          labelName: 'Submitted Requests',
          icon: Icon(Icons.done, color: th.pr),
          isSub: true,
        ),
      if (timeline && widget.showtimeline)
        DrawerList(
          index: DrawerIndex.Pending_timesheet,
          labelName: 'Pending Requests',
          icon: Icon(Icons.access_time, color: th.pr),
          isSub: true,
        ),



      DrawerList(
        index: DrawerIndex.settings,
        labelName: 'Settings',
        icon: Icon(Icons.settings, color: th.pr),
        isSub: false,
      ),
      DrawerList(
        index: DrawerIndex.about,
        labelName: 'About',
        icon: Icon(Icons.info, color: th.pr),
        isSub: false,
      ),
    ];
    getuserdata() async {
      EmpMaster emp = EmpMaster.instance;
//       List ls = await emp.queryAllRows();
      List ls = await emp.queryonlyRows(EmpMaster.userid, uid);
      Map map = ls.last;

      Map mp = Map();

//      mp['pic'] = map[EmpMaster.empimg];


      mp['name'] = map[EmpMaster.empprn]??'Name not found';
      mp['position'] = map[EmpMaster.poscod].toString()??'id not found';
      mp['dept'] = map[EmpMaster.dptcod].toString()??'id not found';
      mp['email'] = map[EmpMaster.addpre].toString()??'id not found';

      mp['email'].toString().compareTo('')==0?mp['email'] = 'Email not available':1;

      return mp;
    }

    return Material(
      color: th.bk,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            color: HexColor('#2F3840'),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/ui/topgrey.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 150.0,
                ),
                FutureBuilder(
                    future: getuserdata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return Positioned(
                            top: 40,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width:10,
                                ),

                                if (snapshot.data['pic'] != null)
                                  CircleAvatar(
//                           backgroundImage:MemoryImage(snapshot.data['pic']

                                    backgroundImage: AssetImage(
                                        'assets/images/userImage.png'),
                                    radius: 50,
                                  )
                                else
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/userImage.png'),
                                    radius: 50,
                                  ),
                                Container(
                                  width: MediaQuery.of(context).size.width/4,
                                ),
                                Column(

                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data['email'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: AppTheme.white,
                                        fontSize: 16,
                                      ),
                                    ),

                                    Text(
                                      snapshot.data['position'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: AppTheme.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data['dept'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: AppTheme.white,
                                        fontSize: 16,
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ));
                      else {
                        return Container();
                      }
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Divider(
            height: 1,
            color: AppTheme.grey.withOpacity(0.6),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerList[index]);
              },
            ),
          ),
          Divider(
            height: 1,
            color: AppTheme.grey.withOpacity(0.6),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: th.pr,
                  ),
                  textAlign: TextAlign.left,
                ),
                trailing: Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                onTap: () {
                  final signin = SigninUser.instance;
                  signin.deleteall();

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Splash()));
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          if (listData.index ==DrawerIndex.absence) {
            widget.drawerUserControllerState.setState(() {
              listData.home_screen.setState(() {
                if (listData.home_screen.absence == true) {
                  listData.home_screen.absence = false;
                } else {
                  listData.home_screen.absence = true;
                }
              });
            });
          } else if(listData.index ==DrawerIndex.timesheet){
            widget.drawerUserControllerState.setState(() {
              listData.home_screen.setState(() {
                if (listData.home_screen.timeline == true) {
                  listData.home_screen.timeline = false;
                } else {
                  listData.home_screen.timeline = true;
                }
              });
            });
          }
          else{
            navigationtoScreen(listData.index);


          }

//          navigationtoScreen(listData.index);
        },
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 6.0,
                        height: 46.0,
                        decoration: BoxDecoration(
                          color: widget.screenIndex == listData.index
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                      listData.isAssetsImage
                          ? Container(
                              width: 24,
                              height: 24,
                              child: Image.asset(listData.imageName,
                                  color: widget.screenIndex == listData.index
                                      ? Colors.blue
                                      : th.pr),
                            )
                          : Icon(listData.icon.icon,
                              color: widget.screenIndex == listData.index
                                  ? Colors.blue
                                  : th.pr),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                      Text(
                        listData.labelName,
                        style: TextStyle(
                          fontWeight: listData.isSub
                              ? FontWeight.normal
                              : FontWeight.bold,
                          fontSize: listData.isSub ? 15 : 17,
                          color: widget.screenIndex == listData.index
                              ? Colors.blue
                              : th.pr,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      listData.endicon != null
                          ? Icon(listData.endicon.icon,
                              color: widget.screenIndex == listData.index
                                  ? Colors.blue
                                  : th.pr)
                          : Container()
                    ],
                  ),
                ),
                widget.screenIndex == listData.index
                    ? AnimatedBuilder(
                        animation: widget.iconAnimationController,
                        builder: (BuildContext context, Widget child) {
                          return Transform(
                            transform: Matrix4.translationValues(
                                (MediaQuery.of(context).size.width * 0.75 -
                                        64) *
                                    (1.0 -
                                        widget.iconAnimationController.value -
                                        1.0),
                                0.0,
                                0.0),
                            child: Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width * 0.75 -
                                        64,
                                height: 46,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.2),
                                  borderRadius: new BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(28),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(28),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
    widget.callBackIndex(indexScreen);
  }
}

enum DrawerIndex {
  dashboard,
  absencerequest,
  savedrequest,
  submittedrequest,
  settings,
  about,
  absence,
  pending  ,


  timesheet,
  Saved_timesheet,
  Submitted_timesheet,
  Pending_timesheet,
  Request_timesheet

}

class DrawerList {
  DrawerList(
      {this.isAssetsImage = false,
      this.labelName = '',
      this.icon,
      this.index,
      this.imageName = '',
      this.endicon,
      this.isabsence = false,
      this.home_screen,
      this.isSub});

  String labelName;
  Icon icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex index;
  Icon endicon;
  bool isabsence;
  _HomeDrawerState home_screen;
  bool isSub;
}
