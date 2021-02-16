

import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  BMIPage(),
    );
  }
}
class BMIPage extends StatefulWidget {
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {

  var weightValue = 65.0;
  var heightValue = 150.0;
  var bmi = 0.0 ;
  var messageFinal = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Bmi Calculator"))),
        body: SingleChildScrollView(
        child: Column(
            children: [
                        SizedBox(height: 20,),
                        Text("Calculate your bmi",style: TextStyle(fontSize: 20,color: Colors.deepPurpleAccent,decoration: TextDecoration.underline),),
                        SizedBox(height: 30,),
                        Image.network("https://www.cdc.gov/healthyweight/images/assessing/bmi-adult-fb-600x315.jpg"),
                        SizedBox(height: 30,),
                        Text("We care about your health",style: TextStyle(fontSize: 17,color: Colors.red),),
                        SizedBox(height:20,),
                        Text("Height - ${heightValue.roundToDouble()}cm"),
                        SizedBox(height: 10,),
                        Slider(
                                value: heightValue,
                                min: 50,
                                max: 200,
                                label: heightValue.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    heightValue = value;
                                  });
                                }
                            ),
                        Text("Weight - ${weightValue.roundToDouble()}kg"),
                        SizedBox(height: 10,),
                        Slider(
                        value: weightValue,
                        min: 30,
                        max: 150,
                        label: weightValue.round().toString(),
                        onChanged: (double value) {
                                setState(() {
                                weightValue = value;
                                  });
                                 }
                                ),
                        Text("Your BMI is $bmi"),
                        SizedBox(height: 10,),
                        Text(" $messageFinal."),
                        FlatButton.icon(
                                color:Colors.red,
                                onPressed: (){
                                  var bmiCalc = weightValue / (pow((heightValue/100),2));
                                  var message = "";
                                  if (bmiCalc < 18){
                                    message = "You are underweight";
                                  }
                                  else if (bmiCalc < 25){
                                    message = "You are normal";
                                  }
                                  else  if (bmiCalc < 30){
                                    message = "You are overweight";
                                  }
                                  else{
                                    message = "You are obese";
                                  }
                                  setState((){
                                    bmi = bmiCalc.roundToDouble();
                                    messageFinal = message;
                                  }
                                  );
                                  print("Hello World");},
                                icon: Icon(Icons.favorite),
                                label: Text("Calculate")
                              ),
                        SizedBox(height: 20,),


                          ],
                      ),
                    )
                  );
                 }
                }






