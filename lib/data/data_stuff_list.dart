import 'package:flutter/material.dart';

class Stuff {
  final String name;
  final int price;
  final Color bgColor;
  final Color fgColor;

  const Stuff({
    required this.name,
    required this.price,
    required this.bgColor,
    required this.fgColor,
  });
}

class ColorData {
  final Color fgColor;
  final Color bgColor;

  const ColorData({
    required this.bgColor,
    required this.fgColor,
  });
}

enum COLOR { blue, orange, red, green }

const List<ColorData> colorStuff = [
  ColorData(
    bgColor: Color(0xFFEEF7FE),
    fgColor: Color(0xFF415EB6),
  ),
  ColorData(
    bgColor: Color(0xFFFFFBEC),
    fgColor: Color(0xFFFFB110),
  ),
  ColorData(
    bgColor: Color(0xFFFEEEEE),
    fgColor: Color(0xFFAC4040),
  ),
  ColorData(
    bgColor: Color(0xFFF0FFFF),
    fgColor: Color(0xFF23B0B0),
  )
];

List<Stuff> stuffs = [
  Stuff(
    name: "Mouse Fantech Aria",
    price: 890000,
    bgColor: colorStuff[0].bgColor,
    fgColor: colorStuff[0].fgColor,
  ),
  Stuff(
    name: "Kopi Good day",
    price: 2000,
    bgColor: colorStuff[1].bgColor,
    fgColor: colorStuff[1].fgColor,
  ),
  Stuff(
    name: "Pringless Chess",
    price: 24000,
    bgColor: colorStuff[2].bgColor,
    fgColor: colorStuff[2].fgColor,
  ),
  Stuff(
    name: "HP Poco M4 Pro",
    price: 2400000,
    bgColor: colorStuff[3].bgColor,
    fgColor: colorStuff[3].fgColor,
  ),
];
