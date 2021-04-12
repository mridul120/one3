import 'package:blood1/media.dart';
import 'package:blood1/ui/NumbertakeAndOtp/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Otp_Ui.dart';

class NumberTakeUi extends StatelessWidget {
  ///**variable decleration
  String m_number = "";
  var fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onTap:() {
                Navigator.pop(context);
              },
            ),
          ),
      body: Form(
        key: fromKey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter Phone Number",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28,
                    decorationThickness: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: MediaQuerypage.smallSizeHeight * 3,
              ),
              Row(
                children: [
                  Text(
                    '+880 : ',
                    style: TextStyle(fontSize: 18, decorationThickness: 20.0),
                  ),
                  Expanded(
                    child: TextFormField(
                      //textInputAction: true,
                      obscureText: false,
                      autofocus: true,
                      enabled: true,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^1+\d{0,9})')),
                      ],
                      //keyboardAppearance: ,
                      //suffixStyle: const TextStyle(color: Colors.green),
                      decoration: InputDecoration(
                        hintText: '1+(1-9)',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width:2,
                              color: Colors.black),
                        ),
                      ),
                      validator: (value) {
                        if (value.isEmpty)
                          return 'Please Enter the phone number';
                        return null;
                      },
                      onSaved: (String value) {
                        m_number = value;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuerypage.smallSizeHeight * 2,
              ),
              ///***buttom
              Container(
                width: MediaQuerypage.screenWidth / 2,
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    //shadowColor: Colors.red,
                    primary: Colors.black,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context)=>Otp_Ui(),
                    ));

                  //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  //       Otp_Ui()), (Route<dynamic> route) => false);
                   },
                  child: Text(
                    'SENT',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
