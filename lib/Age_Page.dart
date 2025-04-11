import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Age_Page extends StatefulWidget{
  @override
  State<Age_Page> createState() => _Age_PageState();
}
class _Age_PageState extends State<Age_Page> {
  var ageController = TextEditingController();
  var DateController = TextEditingController();
  var DaySelected = '';
  var MonthSelected = '';
  var YearSelected = '';
  DateTime today = DateTime.now();
  int age_year = 0;
  int day = 0;
  int month = 0;
  int year = 0;
  var msg = '';
  var result = '';
  var age_month = 0;
  var age_day = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("AGE CALCULATOR",style: TextStyle(fontWeight: FontWeight.bold),)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body:Container(

        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Enter Your Dateofbirth",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 21,),
                SizedBox(
                  width: 300,
                  child: IconButton(icon: Icon(Icons.date_range),
                  onPressed: () async {
                    DateTime? datePicked = await showDatePicker(
                      context: context,
                      initialDate: today,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),);

                    if (datePicked != null) {
                      if (datePicked.isAfter(today)) {

                        msg = 'You are not born yet';
                      }
                      else{
                        day = datePicked.day;
                        month = datePicked.month;
                        year = datePicked.year;
                        int currentDay = today.day;
                        int currentMonth = today.month;
                        int currentYear = today.year;
                        age_year = currentYear - year;
                        age_month = currentMonth - month;
                        age_day = currentDay - day;

                        if (month == 2 && day == 29) {
                          bool isLeapYear = (currentYear % 4 == 0 && currentYear % 100 != 0) || (currentYear % 400 == 0);

                          if (!isLeapYear) {
                            DateTime adjustedBirthday = DateTime(currentYear, 3, 1);
                            if (today.isBefore(adjustedBirthday)) {
                              age_year--;
                            }
                          }
                        } else {
                          if (age_month < 0) {
                            age_year--;
                            age_month += 12;
                          }
                          if (age_day < 0) {
                            int daysInPrevMonth = DateTime(currentYear, currentMonth, 0).day; // Get days in previous month
                            age_month--;
                            age_day += daysInPrevMonth;
                          }
                        }
                        msg = '$age_year Years $age_month Months $age_day Days';

                        setState(() {
                          result = 'Your Age is $msg';
                        });
                      }
                    }
                  },
                    color: Colors.black,
                    iconSize: 30,

                  )
                ),
                SizedBox(height: 21,),
                Text(result,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
          )
                    )

                  )
                )

    );

  }
}