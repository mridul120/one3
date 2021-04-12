
import 'package:blood1/media.dart';
import '../../UInfo_list.dart';
import 'file:///C:/Users/Mridul/AndroidStudioProjects/blood1/lib/ui/Textfile.dart';
import 'package:flutter/material.dart';

///
/// *** variable for vaditon
///
class CreatId extends StatelessWidget {
   /// variaabel declear
  final GlobalKey<ScaffoldState> scaffold = new GlobalKey<ScaffoldState>();
  final from = GlobalKey<FormState>();
  UInfo_list uinfolist=new UInfo_list("new user update");

  ///**** Creat id ui page
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffold,
          appBar: AppBar(
            centerTitle: true,
            title: Textfile('Creat Account', 22, FontWeight.w500),
          ),
          ///****body part
          body: SingleChildScrollView(
            child: Form(
              key: from,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 15, 0),
                child: Column(
                    ///****text field and get info field for user creat
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuerypage.smallSizeHeight,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfile('\t\tFull Name', 16, FontWeight.w500),
                          InputText('Name', Icons.drive_file_rename_outline,
                              uinfolist, from),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuerypage.smallSizeHeight * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfile('\t\tBlood Grope', 16, FontWeight.w500),
                          InputText('Blood Grope', Icons.add_location),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuerypage.smallSizeHeight * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfile('\t\tGmail', 16, FontWeight.w500),
                          InputText('Gmail', Icons.attach_email_outlined),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuerypage.smallSizeHeight * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfile('\t\tLast Donation Time', 16, FontWeight.w500),
                          InputText('Last Donation Time', Icons.calendar_today),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuerypage.smallSizeHeight * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfile('\t\tAge', 16, FontWeight.w500),
                          InputText('Age', Icons.accessibility),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuerypage.smallSizeHeight * 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Textfile('\t\tWeight', 16, FontWeight.w500),
                          InputText('Weight', Icons.line_weight_outlined),
                          //InputText('Blood Grope', Icons.add_location),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuerypage.smallSizeHeight * 3,
                      ),
                      ///****bottom click in
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          botton('save'),
                          botton('cancel'),
                        ],
                      )
                    ]),
              ),
            ),
          )),
    );
  }
  ///
  /// buttom make
  ///
  Widget botton(String value) => InkWell(
        onTap: () async {
          if (value == 'save') {
            if (from.currentState.validate()) {
              from.currentState.save();

              final snackBar = SnackBar(
                  content: Center(child: Text('Succeesfully ' + value)));
              scaffold.currentState.showSnackBar(snackBar);
            }
          }
          ///*****when save successfully then it return to the home page
        },
        child: Container(
            child: Center(
              child: Textfile(value, 20, FontWeight.w500,
                  (value == "save") ? Colors.white : Colors.black),
            ),
            width: MediaQuerypage.smallSizeWidth * 25,
            height: MediaQuerypage.smallSizeHeight * 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23.0),
              color: (value == "save") ? Colors.green : Colors.white,
              //const Color(0xffffffff),
              //border: Border.all(width: 1.0, color: Colors.red),
            )),
      );
}
///
/// textfrom Field make
///
Widget InputText(String stringValue, IconData iconData,
        [UInfo_list uinfolist, var from]) =>
    TextFormField(
      ///***for first word uper case on keyboard
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardtype(stringValue),
      obscureText: false,
      textInputAction: TextInputAction.next,
      // inputFormatters: [
      //   FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
      // ],
      validator: (value) {
        if (value.isEmpty) {
          if (stringValue == 'Name')
            return 'Enter name please';
          else if (value == 'Blood Grope')
            return "Enter BLood grope";
          else if (value == 'Gmail')
            return 'Gmail';
          else if (value == 'Last Donation Time')
            return 'Donation Time';
          else if (value == 'Age')
            return 'Age';
          else if (value == 'Weight') return 'Weight';
        }
        return null;
      },
      onSaved: (String value) {
        if (stringValue == 'Name') {
            uinfolist.name=value.toString();
        } else if (stringValue == 'Gmail') {
            uinfolist.gmail=value.toString();
        } else if (stringValue == 'Blood Grope')
            uinfolist.blood_grope=value.toString();
        else if (stringValue == 'Age')
            uinfolist.age=value.toString();
        else if (stringValue == 'Weight')
            uinfolist.weight=value.toString();
        else if (stringValue == 'Last Donation Time')
            uinfolist.last_donation_time=value.toString();
      },
      decoration: InputDecoration(
        hintText: stringValue,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white)),
        prefixIcon: Icon(iconData),
      ),
    );

keyboardtype(String value) {
  if (value == 'Name')
    return TextInputType.name;
  else if (value == 'Blood Grope')
    return TextInputType.text;
  else if (value == 'Gmail')
    return TextInputType.emailAddress;
  else if (value == 'Last Donation Time')
    return TextInputType.datetime;
  else if (value == 'Age' || value == 'Weight') return TextInputType.number;
}
