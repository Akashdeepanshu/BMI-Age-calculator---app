import 'package:bmi_app/Age_Page.dart';
import 'package:bmi_app/bmi_Page.dart';
import 'package:bmi_app/frontPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: frontPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:Container(


        color: Theme.of(context).colorScheme.inversePrimary,
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white,width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: Offset(0, 3), // changes position of shadow
                    )],

              ),
            height: 400,
            width: 300,
            //color: Colors.blue,
            child: Column(
              children: [
                Container(
                    height: 200,
                    width: 300,
                    child: Center(child: Text('All In One Calculator',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white),))),
                ElevatedButton(child: Text("BMI Calculator",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BMI()));

                      },


                    ),
                SizedBox(height: 21,),
                ElevatedButton(child: Text("AGE Calculator",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Age_Page()));
                      },

                    ),



              ],
            )
          ),
        ),
      )

    );
  }
}
