

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/AppScreens/Form_Screen/TopBar.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';

class Seacrable_Listview extends StatefulWidget {
  Seacrable_Listview(this.thw, this.title, this.parent,this.grandparent,this.dropdown) ;

  final theme thw;

  final String title;

  final parent;
  final grandparent;
  final dropdown;


  @override
  _Seacrable_ListviewState createState() => new _Seacrable_ListviewState();
}

class _Seacrable_ListviewState extends State<Seacrable_Listview> {
  TextEditingController editingController = TextEditingController();

  var duplicateItems;
  var dropdown;


  var items = List();
  theme th;

  @override
  void initState() {
    th = widget.thw;
    super.initState();
    dropdown =  widget.dropdown;
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: new Scaffold(
        backgroundColor: th.bk,
        body: Container(
          alignment: Alignment.bottomRight,
          color: th.bk,
//        height: 300,
//        width: MediaQuery.of(context).size.width *0.74,
          child: Column(
            children: <Widget>[
              TopBar(th,widget.title,top: 10.0,height: 0.08,uppercontext: context,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    filterSearchResults(value);
                  },
                  controller: editingController,
                  style: TextStyle(
                    color: th.pr,
                  ),
                  decoration: InputDecoration(
                      labelText: "Search",
                      labelStyle: TextStyle(
                        color: th.pr,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: th.pr,
                      ),
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: th.pr),
                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: th.pr),
                          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                      future: dropdown.getListview(context,widget , widget.grandparent,th),
                    builder: (context, snapshot) {
                      if(snapshot.hasData)
                        {
                          if(snapshot.data.length==0){
                            return Text("No Data Foundss");

                          }
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return  snapshot.data[index];
                            },
                          );


                        }
if(snapshot.data==null){
  return Text('NO RECORD FOUND',style: TextStyle(color: th.pr));

}

                      return ModalProgressHUD(
                        inAsyncCall: true,
                        child: Container(height: 12,
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getAppBarUI() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: HexColor("#F5F5F5"),
          width: 2,
        ),
        color: HexColor('#256CD0'),
//                    borderRadius: const BorderRadius.only(
//                      bottomLeft: Radius.circular(32.0),
//                    ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: FintnessAppTheme.grey.withOpacity(0.4),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/topheaderblue.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                ),
                Positioned(
                  top: 32,
                  child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(0),
                    child: FlatButton.icon(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        label: Text('')),
                  ),
                ),
                Positioned(
                  top: 38,
                  left: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.title.replaceAll("Select", ""),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          letterSpacing: 1.2,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w100,
                          fontSize: 20,
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
