


import 'dart:convert';

import 'package:http/http.dart';
import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/Database_Files/Inserting_All_DB.dart';
import 'package:sm_service/Database_Files/Local_DB/DashBoard_DB/NotificationCount.dart';


import 'dart:convert' as JSON;
initGetNotificationCount ( username, password) async {
  insering_allDB dbvar = insering_allDB();

//  GetGetNotificationCount+=uid;
  String gtr = GetGetNotificationCount+ uid;

  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));


  Response r = await get(gtr  ,
      headers: <String, String>{'authorization': basicAuth});


  if(r.statusCode==200){
    final json=JSON.jsonDecode(r.body);
    NotificationCount notificationCount = NotificationCount.instance;
    notificationCount.deleteall();

    dbvar.insert_notificationCount(

      notificationCountvar:json[0]['${NotificationCount.notificationCount}'].toString(),);

  }

}



