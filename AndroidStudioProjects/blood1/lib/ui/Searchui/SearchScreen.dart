
import 'package:blood1/media.dart';
import 'package:blood1/ui/UserInfoScreen/Userinfo.dart';
import 'package:blood1/ui/homesreen/rowitemload.dart';
import 'package:flutter/material.dart';
class SearchScreen extends StatelessWidget {
  final items = List<String>.generate(10, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('DonarList'),
         centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Row(
              children: [
                rowitem('assets/images/blood-donation.png','  Blood grope'),
                SizedBox(width: MediaQuerypage.smallSizeWidth*10,),
                rowitem('assets/images/blood-donation.png','  Location'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                            child: Image.asset('assets/images/userIcon.png')),
                        Text('Dhaka',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              backgroundColor: Colors.green),),
                      ],
                    ),
                    title: Text('MH Mridul'),
                    subtitle: Text(
                        'mridul725@gmail.com\n 01629055318'
                    ),
                    trailing: SizedBox(
                     height: MediaQuerypage.smallSizeHeight*5,
                       child: Image.asset('assets/images/callIcon.png')),
                    isThreeLine: true,
                  onTap: (){
                      /*\
                      user info see
                       */
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Userinfo_Ui()));
                  },
                  ),

                );
              },
            ),
          ),
        ],
      ),
    )
    );
  }
}
