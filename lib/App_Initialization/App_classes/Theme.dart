import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Night{
  Color pr = Colors.white;
  Color bk = HexColor('#202839');

}
class Day{
  Color pr = HexColor('#2F3840');
  Color bk =  HexColor("#F2F2F2");
}
class   theme {
  Color pr = Day().pr;
  Color bk = Day().bk;
}