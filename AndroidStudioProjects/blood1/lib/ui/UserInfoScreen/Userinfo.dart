import 'package:blood1/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Girdview.dart';
import '../Textfile.dart';

class Userinfo_Ui extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    if (true) {

      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        //extendBodyBehindAppBar: true,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 8, 30.0, 0),
          child: Column(
              verticalDirection: VerticalDirection.down,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///**part 1
                Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        ///**user image
                        backgroundColor: Colors.transparent,
                        radius: MediaQuerypage.smallSizeWidth * 15,
                        child: Image.asset('assets/images/userpik.png'),
                      ),

                      ///**User Name and location
                      Textfile('Kamrul', 29, FontWeight.w500),
                      Textfile('Dhanmondi,Dhaka', 20, FontWeight.w500),
                      //SizedBox(height: MediaQuerypage.smallSizeHeight*2,),
                    ]),

                ///**part 2  other info user show by girdview
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuerypage.smallSizeHeight * 2,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Textfile('Info', 22, FontWeight.w700)),
                          Textfile('Edit', 22, FontWeight.w700, Colors.red),
                        ],
                      ),
                      Girdview(),
                    ],
                  ),
                ),
              ]),
        ),
      ));
    } else {
      return Scaffold(//appBar: AppBar(),
          body: Center(child: Text('Please Make an Account')));
    }
  }
}
