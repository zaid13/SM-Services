
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/AppScreens/Form_Screen/Body.dart';
import 'package:sm_service/AppScreens/Listview/List_tile.dart';
import 'package:sm_service/AppScreens/UI_Classes/Absence/Pending.dart';
import 'package:sm_service/AppScreens/UI_Classes/Absence/Saved.dart';
import 'package:sm_service/AppScreens/UI_Classes/Absence/Submitted.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Local_DB/Absence_Transaction.dart';
import 'package:sm_service/Database_Files/Server_Files/Eb_prllevtrx_status.dart';



getPENDINGRECORDS() async {
  final   absence_Transaction = Absence_Transaction.instance;


  List o = await absence_Transaction.queryAllRows();
  o.forEach((element) {



  });


  final Eb_prllevtrx_status eb_prllevtrx_status  = Eb_prllevtrx_status.instance;
  List lsmax = await eb_prllevtrx_status.queryMaxandOnlyRows(Eb_prllevtrx_status.seq);


  if(lsmax.length==0) return null;

  List statusMaxSeq =await eb_prllevtrx_status.queryonlyRows( lsmax.first['MAX(seq)'] ,Eb_prllevtrx_status.seq,Eb_prllevtrx_status.Processed,"0",Eb_prllevtrx_status.MainApproverUserID,uid);

  List <Map> AbsList_SUB= [] ;
    for(int i = 0 ; i<statusMaxSeq.length ; i++)
    AbsList_SUB +=await absence_Transaction.queryonlyRows(statusMaxSeq[i]['LeaveTransactionID'],Absence_Transaction.recordIDD,);


return AbsList_SUB;

}



class List_view extends StatefulWidget {
  List_view(this.screentype,this.thw);
  Screen_type screentype;


  @override
  _List_viewState createState() => _List_viewState();
  theme thw ;
}

class _List_viewState extends State<List_view> {

  final   absence_Transaction = Absence_Transaction.instance;
  theme th = theme();
  initlist()async{    // TODO: implement initState


    List<List_Tile> Widlist = [];

   List all_records  = await  getPENDINGRECORDS();




    List lst=[];

    if (widget.screentype == Screen_type.Saved_Request) {
      lst = await absence_Transaction.queryonlyRows( 'Saved',Absence_Transaction.operation);
    }
    if (widget.screentype == Screen_type.Pending_Request) {
      lst = await getPENDINGRECORDS();
       // lst = await absence_Transaction.queryonlyRows( 'ReadyToSubmit',Absence_Transaction.operation);
    }
    if (widget.screentype == Screen_type.Submitted_Request) {
      lst = await absence_Transaction.queryAllRows();
      // lst = await absence_Transaction.queryonlyRows( 'Downloaded',Absence_Transaction.operation);
    }






    lst.forEach((element) {

      Widlist.add(

          List_Tile(

            mobid: element['${Absence_Transaction.mobid}'],
            trxnum: element['${Absence_Transaction.transactionNumber}'],
            employeeCode: element['${Absence_Transaction.employeeCode}'],
            leaveTypeCode: element['${Absence_Transaction.leaveTypeCode}'],
            entryType:element['${Absence_Transaction.entryType}'].toString(),
            LeaveCode: element['${Absence_Transaction.LeaveCode}'],
            clr: th.pr,
           element: element

          )

      );

    });
    return Widlist  ;
  }
  @override
  Future<void> initState()  {

    th.pr = widget.thw.pr;
    th.bk = widget.thw.bk;

  }
  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor:   th.bk,
        appBar: AppBar(
          backgroundColor: HexColor('#2F3840'),
//        backgroundColor: Hexcolor('#0D428D'),
          title: Container(

              padding: EdgeInsets.only(left: 40,top: 5),
              alignment: Alignment.centerLeft,

              child: Text(          widget.screentype.toString().replaceAll("Screen_type.", '').replaceAll('_', ' ')+ 's')),),

        body:    FutureBuilder(
            future: initlist(),
            builder: (context, snapshot) {
              if(snapshot.hasData){

                List ls =  snapshot.data;

                return ListView.builder(
                  itemCount: ls.length,
                  itemBuilder:(context, index) {


                    return  FlatButton(
                        onPressed: (){


                          if (widget.screentype == Screen_type.Saved_Request) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Saved(widget.thw,ls[index].mobid  )));
                          }
                          if (widget.screentype == Screen_type.Pending_Request) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Pending(widget.thw ,ls[index].mobid )  ));

                          }

                          if (widget.screentype == Screen_type.Submitted_Request) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  Submitted(widget.thw  ,ls[index].mobid )));

                          }



                        },
                        child: ls[index]);




                  }, );}

              return Text('Wait');

            }
        ),
      ),
    );
  }
}