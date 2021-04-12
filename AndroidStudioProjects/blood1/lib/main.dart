import 'package:blood1/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Provideritem.dart';
import 'media.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white,
    //systemNavigationBarColor: Colors.redAccent
    //backwardsCompatibility: false,

  ));
  runApp(
    MultiProvider(
    providers: [
      ///**call provider for blood seleted  state managent
      ChangeNotifierProvider(create: (context) => ProviderItem()),
      //Provider(create: (context) => SomeOtherClass()),
    ],
    child: MyApp(),
  ),);

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    MediaQuerypage.init(context);
    return Scaffold(
      body:CustomSplashScreen(),
    );
  }
}
