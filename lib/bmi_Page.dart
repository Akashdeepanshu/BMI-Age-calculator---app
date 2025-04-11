import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMI extends StatefulWidget{



  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  var wtController = TextEditingController();

  var ftController = TextEditingController();

  var inController = TextEditingController();

  var result = '';

  var bgcolor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI CALCULATOR",style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
          body: Container(
            color: bgcolor,
            child: Center(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('BMI',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    SizedBox(height: 21,),
                    TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                          label: Text('Weight',style: TextStyle(fontWeight: FontWeight.bold),),
                          prefixIcon: Icon(Icons.line_weight)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                          label: Text('Height in feet',style: TextStyle(fontWeight: FontWeight.bold),),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text('Height in inches',style: TextStyle(fontWeight: FontWeight.bold),),
                          prefixIcon: Icon(Icons.height)
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 21,),
                    ElevatedButton(onPressed: (){
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != '' && ft != '' && inch != ''){
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var Inch = int.parse(inch);
                        var tInch = (ift * 12) + Inch;
                        var tCm = tInch * 2.54;
                        var tM = tCm / 100;
                        var bmi = iwt / (tM * tM);
                        var msg = '';

                        if (bmi > 25){
                          msg = 'You are overweight';
                          bgcolor = Colors.orange.shade300;

                        }
                        else if (bmi < 18.5){
                          msg = 'You are underweight';
                          bgcolor = Colors.red.shade300;
                        }
                        else{
                          msg = 'You are Healthy';
                          bgcolor = Colors.green.shade300;
                        }

                        setState(() {
                          result = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                        });


                      }
                      else{
                        setState(() {
                          result = 'Please fill all the required fields';
                        });
                      }

                    }, child: Text('Calculate',style: TextStyle(fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(height: 21,),
                    Text(result,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

                  ],
                ),
              ),

            ),
          )
    );
  }
}