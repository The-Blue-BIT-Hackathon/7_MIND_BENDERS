
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../sign in/signin.dart';
import '../../size_config.dart';

class  SplashScreen extends StatefulWidget {

  static String routeName="/splash";
  const SplashScreen({Key? key}) : super(key: key);
  //static String routeName="/splash";
  //static String routeName="/splash";
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  var auth =FirebaseAuth.instance;
  var isLogin =false;
  checkIfLogin() async{
    auth.authStateChanges().listen((User? user) {
      if(user!=null && mounted){
        setState(() {
          isLogin=true;
        });
      }
    });
 }

  void initState()
  {
    //checkIfLogin();
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async
  {
    await Future.delayed(Duration(milliseconds: 5000),(){});// await for 1.5 seconds


    //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> SignInScreen()));
    if(isLogin==true)
    {
      //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> HomeScreen()));
    }
    else
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> SignInScreen()));
      //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> MobileLogin()));

    }


  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,

        body:
        Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child:
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/homelogo2.gif", height: 200, width: 400,alignment: Alignment.topCenter,),
                  SizedBox(height: 10,),
                  Text("Visualize Grow", style: TextStyle(
                      fontSize: 30,fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent
                  ),
                  ),
                  SizedBox(height: 10,),

                ],
              ),
            )
        )
    );
  }
}


