
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Textfile extends StatelessWidget {
  String text;
  double textsize;
  FontWeight font;
  Color red=Color(0xff000000);
  Textfile(this.text,this.textsize,this.font, [this.red]);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: //GoogleFonts.lato(textStyle:
      TextStyle(
      fontWeight: font,
      fontFamily: 'Segoe UI',
      fontSize: textsize,
      color: red,
    ),
    textAlign: TextAlign.left,
    );
  }
}
