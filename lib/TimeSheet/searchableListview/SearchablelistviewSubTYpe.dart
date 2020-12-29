


import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/App_Initialization/App_classes/DropDowns.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class Seacrable_ListviewForSubmenu extends StatefulWidget {
  Seacrable_ListviewForSubmenu(this.thw, this.title, this.parent,this.grandparent,this.dropdown) ;

  final theme thw;

  final String title;

  final parent;
  final grandparent;
  final dropdown;


  @override
  _Seacrable_ListviewForSubmenuState createState() => new _Seacrable_ListviewForSubmenuState();
}

class _Seacrable_ListviewForSubmenuState extends State<Seacrable_ListviewForSubmenu> {
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
    print(items.length.toString() + ' ===');
    return new Scaffold(
      backgroundColor: th.bk,
      body: Container(
        alignment: Alignment.bottomRight,
        color: th.bk,
//        height: 300,
//        width: MediaQuery.of(context).size.width *0.74,
        child: Column(
          children: <Widget>[
            getAppBarUI(),
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
                  future: dropdown.getListviewforSub(context,widget , widget.grandparent),
                  builder: (context, snapshot) {
                    if(snapshot.hasData)

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          print("object");
                          return  snapshot.data[index];
                        },
                      );

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


