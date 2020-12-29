  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
  import 'package:hexcolor/hexcolor.dart';
  import 'package:intl/intl.dart';
  import 'package:modal_progress_hud/modal_progress_hud.dart';
  import 'package:sm_service/App_Initialization/App_classes/Tab_Icons.dart';
  import 'package:sm_service/App_Initialization/App_vatiables.dart';

  import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
  import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
  import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/NotificationCount.dart';
  import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/ScheduledAbsence.dart';
  import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/VacationBalance.dart';

class DashBoardWrapper extends StatefulWidget {
  theme thw;
  bool showabsence;
  DashBoardWrapper(this.thw,this.showabsence);
  @override
  _DashBoardWrapperState createState() => _DashBoardWrapperState();
}

class _DashBoardWrapperState extends State<DashBoardWrapper>
    with TickerProviderStateMixin {
  AnimationController animationController;

//  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: FintnessAppTheme.background,
  );

  @override
  void initState() {
    //
    // tabIconsList.forEach((TabIconData tab) {
    //   tab.isSelected = false;
    // });
    // tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);


    tabBody = DashBoard(widget.thw ,widget.showabsence, animationController: animationController,);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: FintnessAppTheme.background,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder<bool>(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const SizedBox();
              } else {
                return Stack(
                  children: <Widget>[
                    tabBody,

                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

}



class DashBoard extends StatefulWidget {
  theme thw;
  bool showabsence;
  DashBoard(this.thw,this.showabsence,  {Key key, this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard>
    with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  theme th  = theme();

  @override
  void initState() {
    th = widget.thw;
//    fs = FiltersScreenState(context  ,parent: this);

    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
//    addAllListData();

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
    super.initState();
  }


  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }
  @override
  void setState(fn) {
    // TODO: implement setState
//    fs = FiltersScreenState(context  ,parent: this);
  }

  getdashdataNotifications() async {
    NotificationCount notificationCount = NotificationCount.instance;

    List ls = await notificationCount.queryAllRows();


    if(ls.length==0)
    {return 'NO';}

    Map mp  = ls.first;

    return mp[NotificationCount.notificationCount];




  }

  getdashdataBalances() async {
    VacationBalance vacationBalance = VacationBalance.instance;

    List ls = await vacationBalance.queryAllRows();



    if(ls.length==0)
    {return [];}


    List<Map> list  =[];

    ls.forEach((element) {

      list.add(
          {VacationBalance.LeaveCode:
          element[VacationBalance.LeaveCode],
            VacationBalance.Balance:
            element[VacationBalance.Balance],


          });
    });



    return list;

  }

  getdashdataSchedule() async {


    ScheduledAbsence scheduledAbsence=ScheduledAbsence.instance;
    List ls = await scheduledAbsence.queryAllRows();

    if(ls.length==0)
    {return null;}

    Map mp = ls.first;

    return mp;



  }

  @override
  Widget build(BuildContext context) {
    gettile(String title ,IconData icon , Widget wid,Color clr , Color txtcler, Color bellclr){
      return Padding(
        padding: const EdgeInsets.only(

            top: 10,
            bottom:5,
            right: 16,
            left: 16),
        child:   Card(

          elevation: 10,

          child: Column(
            children: <Widget>[
              Container(
                color: clr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(child: Text(title,  style: TextStyle(fontSize: 19,color: txtcler,fontWeight: FontWeight.bold),)),
                      Icon(icon,color: bellclr,size: 25,)
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child:wid,
              )


            ],
          ),),
      );


    }



    listViews.clear();


    listViews.add( FutureBuilder(
      future: getdashdataNotifications(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          return    gettile("Notifications", Icons.notifications ,

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    Text("There are ${snapshot.data} pending approvals of absence request(s)for your review",style: TextStyle(fontSize: 17)),
                    Container(
                      height: 10,
                    ),
                    Text("Your request no. 123 has been approved.",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),

                  ],
                ),
              ) ,

              HexColor('#3C86F5').withOpacity(0.15) ,HexColor('#3C86F5'),HexColor('#3C86F5').withOpacity(0.6) );
        }
        else{
          return SizedBox(
            height: 50,
            child: ModalProgressHUD(
              inAsyncCall: true,
              child: Container(

              ),
            ),
          );

        }
      },
    ));
    if(widget.showabsence)
      listViews.add( FutureBuilder(
        future: getdashdataBalances(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return              gettile("Absence Balances", Icons.dialpad ,

                Padding(
                  padding: const EdgeInsets.only(bottom: 15,left: 14,right: 14),
                  child:     ListView.builder(
                      shrinkWrap:true,

                      itemCount: snapshot.data.length,

                      itemBuilder: (context, index) {



                        return  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text("${snapshot.data[index][VacationBalance.LeaveCode]}",style: TextStyle(fontSize: 17)),
                            Text("${double.parse(snapshot.data[index][VacationBalance.Balance]).toInt()}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),


                          ],
                        );

                      }
//                    mainAxisAlignment: MainAxisAlignment.start,

                  ),
                ) ,

                HexColor('EE9450').withOpacity(0.15),HexColor('#EE9460'),HexColor('#EE9460').withOpacity(0.7));
          }
          else{
            return SizedBox(
              height: 50,
              child: ModalProgressHUD(
                inAsyncCall: true,
                child: Container(

                ),
              ),
            );

          }
        },
      ));
    if(widget.showabsence)

      listViews.add( FutureBuilder(
        future: getdashdataSchedule(),
        builder: (context, snapshot) {
          if(snapshot.hasData  && snapshot.data.length>0  ){
            var variable ;
            variable = Container();

            if(snapshot.data[ScheduledAbsence.Hourly].toString().compareTo('true')==0){
              variable= Text(snapshot.data[ScheduledAbsence.FromTime].toString()+ " - "+
                  snapshot.data[ScheduledAbsence.ToTime].toString(),style: TextStyle(fontSize: 18,fontWeight :FontWeight.w500));

            }
            // GoogleFonts.Arial(
            //
            // );
            // GoogleFonts.Rubik();



            return                    gettile("Next Schedule Absence", Icons.calendar_today ,

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(snapshot.data[ScheduledAbsence.LeaveCode],style: TextStyle(fontSize: 18)),

                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(DateFormat('d-MMM-yyyy').format( DateTime.parse(snapshot.data[ScheduledAbsence.FromDate].toString().substring(0,10)))+ " - "+
                              DateFormat('d-MMM-yyyy').format( DateTime.parse(snapshot.data[ScheduledAbsence.ToDate].toString().substring(0,10))),style: TextStyle(fontSize: 18,fontWeight :FontWeight.w500))),

                      variable


                    ],
                  ),
                ) ,

                HexColor('#CC8FE2').withOpacity(0.15) , HexColor('#CC8FE2'), HexColor('#CC8FE2').withOpacity(0.9) );
          }
          if(snapshot.data==null){
            return  gettile("Next Schedule Absence", Icons.calendar_today ,

                Padding(
                  padding: const EdgeInsets.only(right: 12,left: 12,bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('',style: TextStyle(fontSize: 18)),

                      Container(
                          height: 100,
                          alignment: Alignment.topLeft,
                          child: Text('Currently there is no next scheduled absence',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 17),)),



                    ],
                  ),
                ) ,

                HexColor('#CC8FE2').withOpacity(0.15) , HexColor('#CC8FE2'), HexColor('#CC8FE2').withOpacity(0.9) );
          }
          else{
            return SizedBox(
              height: 50,
              child: ModalProgressHUD(
                inAsyncCall: true,
                child: Container(

                ),
              ),
            );

          }
        },
      ));

    Widget getMainListViewUI() {
      return FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {



            return ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top ,
                bottom: 62 + MediaQuery.of(context).padding.bottom,
              ),
              itemCount:     listViews.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                widget.animationController.forward();

                return listViews[index];
//              return Text("uiouiui");
              },
            ) ;
          }
        },
      );
    }

    Widget getAppBarUI() {
      return Container(
        height:topbarHeight,
        width: MediaQuery.of(context).size.width,
        color:HexColor('#2F3840'),
        child: Stack(
          children: <Widget>[
            Positioned(
              top:38,
              left: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Dashboard',
                    textAlign: TextAlign.center,
                    style: TextStyle(

                      fontFamily: FintnessAppTheme.fontName,
                      fontWeight: FontWeight.w700,
                      fontSize: topbarTitleSize ,
                      letterSpacing: 1.2,
                      color: Colors.white,

                    ),
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
      );
    }






    return SafeArea(
      child: Container(
        color: th.bk,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              getAppBarUI(),
              Expanded(child: getMainListViewUI()),


            ],
          ),
        ),
      ),
    );
  }


}
