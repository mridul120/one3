import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Textfile.dart';

class Girdview extends StatelessWidget {
  List<Infolist> infolist = [
    Infolist('Blood Grope', 'A+',Icons.add_box),
    Infolist('Donation Times', '5',Icons.add),
    Infolist('Donation', '15/3/2021',Icons.add_circle),
    Infolist('Weight', '75',Icons.line_weight),
    Infolist('Age', '24',Icons.data_usage),
    Infolist('Mobile', '01969878396',Icons.call),
    Infolist('Gmail ', 'mridul725@gmail.com',Icons.mail),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
          children: List.generate(infolist.length, (index) {
            return InkWell(
              onTap: () {
                //ontap option
              },
              child: cardMake(infolist[index]),
            );
          })),
    );
  }

  cardMake(Infolist infolist) =>Card(
      margin: EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.transparent,
    //elevation: 10.0,
     child:Column(
       children: [
         Icon(infolist.icon,size:70),
         Textfile(infolist.infoname, 14, FontWeight.w400),
         Expanded(child: Textfile(infolist.infoabout, 16, FontWeight.w700)),
       ],
     )
  );
}

class Infolist {
  String infoname;
  String infoabout;
  IconData icon;
  Infolist(this.infoname, this.infoabout,this.icon);
}