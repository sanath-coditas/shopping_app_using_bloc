import 'package:flutter/material.dart';

const kheadingStyle =
    TextStyle(color: Color.fromRGBO(125, 125, 125, 1), fontSize: 25);
const kprimaryColor = Color.fromRGBO(
  172,
  172,
  172,
  1,
);
const kheadingColor = Color.fromRGBO(125, 125, 125, 1);
const kbackgroundColor = Color.fromRGBO(235, 235, 235, 1);
const kshoppingHeadingStyle = TextStyle(
  fontSize: 25,
  color: Color.fromRGBO(69, 220, 175, 1),
  fontWeight: FontWeight.bold,
);
const kmainHeadingColor = Color.fromRGBO(69, 220, 175, 1);
const knumberStyle = TextStyle(
    fontSize: 25, color: kmainHeadingColor, fontWeight: FontWeight.bold);

const kpriceStyle =
    TextStyle(color: kheadingColor, fontSize: 25, fontWeight: FontWeight.bold);

var kaddButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(kmainHeadingColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    )));
const ktitleTextStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
const ksubTitleTextStyle = TextStyle(fontSize: 20);
var ktileBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10),
);
var kshimmerBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: Colors.white,
);

const kcustomDivider = Padding(
  padding:  EdgeInsets.all(4.0),
  child: Divider(
    thickness: 2,
    color: Colors.black45,
  ),
);
