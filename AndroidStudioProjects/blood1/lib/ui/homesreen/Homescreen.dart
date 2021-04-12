import 'dart:async';
import 'package:blood1/ui/CreatUserId/CreatId.dart';
import 'package:blood1/ui/NumbertakeAndOtp/NumberTakeUi.dart';
import 'package:blood1/ui/Searchui/SearchScreen.dart';
import 'package:blood1/ui/UserInfoScreen/Userinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import '../../Provideritem.dart';
import '../../media.dart';
import '../Textfile.dart';
import 'GirdggropeBlood.dart';
import 'rowitemload.dart';

class Homescreeen extends StatefulWidget {
  Homescreeen({
    Key key,
  }) : super(key: key);

  @override
  _HomescreeenState createState() => _HomescreeenState();
}

class _HomescreeenState extends State<Homescreeen> {
  ///**blood item selated

  List<Bloodlist> mylist = [
    Bloodlist('A+', false),
    Bloodlist('B+', false),
    Bloodlist('O+', false),
    Bloodlist('AB+', false),
    Bloodlist('A-', false),
    Bloodlist('B-', false),
    Bloodlist('O-', false),
    Bloodlist('AB-', false),
  ];
  final _formKey = GlobalKey<FormState>();
  final scaffold = GlobalKey<ScaffoldState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String _location = null;
  int indexnumber;

  void initState() {
    super.initState();
  }

  void dispose() {
    _typeAheadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderItem>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          //Colors.white,
          centerTitle: true,
          title: Text(
            'Find Donor',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            ///**User Info
            icon: Icon(
              Icons.account_box_rounded,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Userinfo_Ui()));
            },
          ),
          actions: <Widget>[
            ///****use create acount bottom
            IconButton(
              icon: Icon(
                Icons.add,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () {
                ///**for creat new users
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NumberTakeUi()));
              },
            )
          ],
        ),

        ///****Body part
        body: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      child: rowitem('assets/images/blood-donation.png',
                          '\t\t Blood Donar', Colors.red)),
                  SizedBox(
                    height: MediaQuerypage.smallSizeHeight * 2,
                  ),
                  GridView.count(
                      crossAxisCount: 4,
                      shrinkWrap: true,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      children: List.generate(mylist.length, (index) {
                        return InkWell(
                          onTap: () {
                            provider.updateSelectItem(mylist, index);
                          },

                          ///****next class the element found
                          child: GridgropeBuild(mylist[index]),
                        );
                      })),
                  SizedBox(
                    height: MediaQuerypage.smallSizeHeight * 2,
                  ),
                  rowitem('assets/images/blood-donation.png', '  LOCATION'),

                  ///*****        enter location
                  makeTextfiled(),

                  SizedBox(
                    height: MediaQuerypage.smallSizeHeight * 10,
                  ),
                  Container(
                    ///****Search bottom
                    //padding: const EdgeInsets.all(10.0),
                    width: MediaQuerypage.screenWidth,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {}
                        // print('number '+providernext.get());
                        // // if(!mylist[providernext.get()].isSelected){
                        // //   Scaffold.of(context).showSnackBar(
                        // //       SnackBar(content: Text('Select blood item'))
                        // //   );
                        // // }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      child:
                          Textfile('Search', 22, FontWeight.bold, Colors.black),
                    ),
                  ),
                ],
              ),
            )

            ///***endl the homepage
            ),
      ),
    );
  }

  ///*****Location textboX with suggestion
  Widget makeTextfiled() {
    ///****make custom text editor for make get location info with suggestion
    return Form(
        key: _formKey,
        child: TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
              autofocus: false,
              obscureText: false,
              cursorColor: Colors.red,
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.text,
              controller: _typeAheadController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ))),
          itemBuilder: (context, suggestion) {
            print(context);
            return ListTile(
              title: Text(suggestion),
              leading: Divider(
                thickness: 1,
              ),
            );
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Please select a city';
            }
            return null;
          },
          suggestionsCallback: (pattern) async {
            print("Saggestion show "+pattern);
            return await sortthelist(pattern.toString());
          },
          onSaved: (value) => this._location = value,
          onSuggestionSelected: (suggestion) {
            this._typeAheadController.text = suggestion;
          },
        ));
  }

  List<dynamic> dname = [
    'Dhaka',
    'Chittagong',
    'Ranger',
    'Brahmonbaria',
    'Borguna'
  ];

  FutureOr sortthelist(String pattern) {
    return dname.toString().toLowerCase().contains(pattern.toLowerCase());
  }
}
