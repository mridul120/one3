
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../media.dart';

class GridgropeBuild extends StatelessWidget {

  Bloodlist bloodlist;
  GridgropeBuild(this.bloodlist);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          bloodlist.bloodname,
          style: TextStyle(
            fontFamily: 'Segoe UI',
            fontSize: (bloodlist.bloodname=='AB+' ||
                bloodlist.bloodname=='AB-')?26:28,
            color: const Color(0xff151414),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      width: MediaQuerypage.smallSizeWidth*16.0,//78.0
      height: MediaQuerypage.smallSizeHeight*18.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.0),
        color: bloodlist.isSelected? Color(0xffff0000): Colors.white,
        border: Border.all(width: 1.0, color: const Color(0xff979393)),
      ),
    );
  }
}

class Bloodlist {
   bool isSelected;
  final String bloodname;
  Bloodlist(this.bloodname, this.isSelected);

}
