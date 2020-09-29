

import 'package:flutter/material.dart';

class DropDown_5{
  String DropDownCode;
  String DropDownValue ='0';


  getListview(context, widget) async {
    List ls = await getlist();

    List <Widget> widlist = [];

    ls.forEach((element) {
      widlist.add(Container(
        child: FlatButton(
          onPressed: () {
            widget.parent.setState(() {


            });
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Flexible(
                child: ListTile(
                    title: Text(element)
                ),
              ),
//                          Flexible(
//                            child: ListTile(
//                              title: Text('${items[index]}'),
//                              subtitle: Text('${items[index]}'),
//                            ),
//                          ),
            ],
          ),
        ),
      ));
    });

    return widlist;
  }

  getlist(){
    List ls = [];
    for(int i = 0 ; i<10 ; i++){
      ls.add(i.toString());
    }

    return ls;
  }
}

