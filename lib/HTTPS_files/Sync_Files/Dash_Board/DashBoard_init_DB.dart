import 'dart:convert';

import 'package:http/http.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';

import 'dart:convert' as JSON;


iningetmenu() async {

  insering_allDB dbvar = insering_allDB();

  String   GetMenu = 'http://smemobapi.azurewebsites.net/api/Menu/GetMenu?userid=$uid&module=Payroll&submod=Transactions&form=Absence%20Request';

  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$id:$pas'));
  Response r = await get(GetMenu  ,
      headers: <String, String>{'authorization': basicAuth});
  final json=JSON.jsonDecode(r.body);




  if(r.statusCode==200  && json.length>0){

    Map mp  = json[0];
    dbvar.insert_Menue(
        ID:mp['ID'],
        description:mp['Description'],
        subMenu: mp['SubMenu'],
        SubMod: mp['SubMod'],
        Url: mp['Url'],
        name: mp['Name']
    );

  }
  else{

  }


}