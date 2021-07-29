import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Todo Variables

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(
          seconds: 5,
        ),
        () => Navigator.pushNamedAndRemoveUntil(
            context, "/loginPage", (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
        body: Container(
          decoration: BoxDecoration(
            gradient: SweepGradient(
              colors: [Colors.yellowAccent,Colors.greenAccent,Colors.red,Colors.orangeAccent,Colors.blueAccent,Colors.yellowAccent],
            )
          ),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset(
            'assets/images/s.png',
            height: 100,
          ),
                  Text("Fashion App",style: TextStyle(
                      fontSize: 20,
                      fontFamily: "JuliusSansOne",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5,
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            blurRadius: 4
                        ),
                      ]


                  ),),
                //Todo Text NAme App with Anew Fonts
                SpinKitCircle(
                    color: Colors.red,
                  ),

                ],
    ),
        ));
  }
}
