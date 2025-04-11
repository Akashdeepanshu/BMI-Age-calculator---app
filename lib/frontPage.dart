import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class frontPage extends StatefulWidget{
  @override
  State<frontPage> createState() => _frontPageState();
}

class _frontPageState extends State<frontPage> {
  @override
  void initState() {

    super.initState();
    Timer( Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'BMI CALCULATOR',)));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            height: 400,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: AnimatedSplashScreen(splash: 'assets_all/Untitled-design-unscreen.gif',
                    splashIconSize: 5000.0,
                    centered: true,
                    nextScreen: const MyHomePage(title: 'BMI CALCULATOR'),
                    duration: 3800,
                    splashTransition: SplashTransition.fadeTransition,
                  ),

                ),
                 SizedBox(
                    height: 100,
                    width: 300,
                    child:Center(child: Text("Two in One Calculator",style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold,color: Colors.black),)),
                  ),
                
              ]
            ),
          ),
        ),
      ),
    );

  }
}