import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart';
import 'dart:convert' as JSON;

import 'package:sm_service/App_Initialization/App_vatiables.dart';
import 'package:sm_service/App_Initialization/Funtions.dart';


validateId(userid , userpass  ,context) async {
  String Validator = 'http://smemobapi.azurewebsites.net/api/Employee/ValidateCredentials?UserName=${userid}&Password=${userpass}';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$userid:$userpass'));
  Response r;


  try {
   r= await get(Validator  ,
        headers: <String, String>{'authorization': basicAuth});

   print(Validator);
   print(r);


  } on Exception catch (_) {


   await SMTP_Email("USER NOT FOUND");

    return null;
    print("throwing new error");
    throw Exception("Error on server");
  }




  if(r.statusCode==200){
    final json=JSON.jsonDecode(r.body);

    id =userid;
    pas =userpass;
    uid = r.body;



    return r.body;
  }
  else{

  return null;
  }

}