import 'package:blood1/media.dart';
import 'package:blood1/ui/CreatUserId/CreatId.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Otp_timer.dart';

class Otp_Ui extends StatefulWidget {
  @override
  _Otp_UiState createState() => _Otp_UiState();
}

class _Otp_UiState extends State<Otp_Ui> with SingleTickerProviderStateMixin {
  ///**varibale decleration

  int time = 30;
  int totalTimeInSeconds;
  AnimationController _controller;
  bool _hideResendButton = false;
  String Otp;

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllertwo = TextEditingController();
  TextEditingController textEditingControllerthree = TextEditingController();
  TextEditingController textEditingControllerfour = TextEditingController();

  FocusNode f1;
  FocusNode f2;
  FocusNode f3;
  FocusNode f4;

  @override
  void initState() {
    // TODO: implement initState
    totalTimeInSeconds = time;
    super.initState();
    f1=new FocusNode();
    f1.requestFocus();
    f2=new FocusNode();
    f3=new FocusNode();
    f4=new FocusNode();
    _controller =
    AnimationController(vsync: this, duration: Duration(seconds: time))
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          setState(() {
            _hideResendButton = !_hideResendButton;
          });
        }
      });
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
    _startCountdown();
  }

  Future<Null> _startCountdown() async {
    setState(() {
      _hideResendButton = true;
      totalTimeInSeconds = time;
    });
    _controller.reverse(
        from: _controller.value == 0.0 ? 1.0 : _controller.value);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    f1.dispose(); f2.dispose();
    f3.dispose(); f4.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              "Verification Code",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  fontSize: 28.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            leading: new InkWell(
              // borderRadius: BorderRadius.circular(30.0),
              child: new Icon(
                Icons.arrow_back,
                color: Colors.black54,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Please enter the OTP sent\n"
                    "on your Phone Number.",
                textAlign: TextAlign.right,
                style: new TextStyle(
                    fontSize: 22.0, color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              _hideResendButton ? _getTimerText : _getResendButton(context),
              Padding(
                padding: const EdgeInsets.fromLTRB(60.0, 0, 60.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _otpTextField(textEditingController,f1),
                    _otpTextField(textEditingControllertwo,f2),
                    _otpTextField(textEditingControllerthree,f3),
                    _otpTextField(textEditingControllerfour,f4),
                  ],
                ),
              )

            ],
          ),
        ));
  }

  ///stop builder from
  ///getTimeText
  get _getTimerText {
    return Container(
      height: MediaQuerypage.smallSizeHeight * 10,
      child: new Offstage(
        offstage: !_hideResendButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(Icons.access_time),
            new SizedBox(width: 5.0,
            ),
            Otp_Timer(_controller, 15.0, Colors.black)
          ],
        ),
      ),
    );
  }

  ///**reset buttom
  Widget _getResendButton(BuildContext context) {
    return new InkWell(
      child: new Container(
        height: MediaQuerypage.smallSizeHeight * 6,
        width: MediaQuerypage.screenWidth / 3,
        decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(32)),
        alignment: Alignment.center,
        child: new Text(
          "Resend OTP",
          style:
          new TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  ///otp text field
  void focuesNode(String value,FocusNode f){
    if(value.length==1)
      f.requestFocus();
  }
  Widget _otpTextField(TextEditingController controller,FocusNode F) {
    return new Container(
      width: MediaQuerypage.smallSizeWidth * 10,
      height: MediaQuerypage.smallSizeHeight * 6,
      alignment: Alignment.center,
      child: TextField(
        focusNode: F,
        textAlign: TextAlign.center,
        obscureText: false,
        ///autofocus: true,
        enabled: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
        controller : controller,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
              RegExp(r'(^\d{0,1})')),
        ],
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.black,
                )
            )
        ),
        onChanged: (value) {
          print("ON Change value "+value.length.toString());
          if(value.length==1){
            //print("In the condiation on change ");
            focuesNode('a', F);
          }
        }
      ),
    );
  }

}