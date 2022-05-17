import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'container_layout.dart';
import 'data_container.dart';

const activeColor = Color(0xFF566de5);
const inActiveColor = Color.fromARGB(255, 255, 255, 255);

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;

  int height = 180;
  int weight = 70;
  int age = 25;
  String result = "";
  String resultDetail = "Result here";
  double bmi = 0;

  void updateBoxColor(int gender){
    if(gender == 1){
      if(maleBoxColor == inActiveColor){
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      }else{
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    }else{
      if(femaleBoxColor == inActiveColor){
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }else{
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getInterpretation(double bmi) {
    if (bmi >= 25) {
      return 'You Have a higher than nomal boby weight. try to exercise more.';
    } else if (bmi > 18.5) {
      return 'You have a nomal boby weigth. Good job!';
    } else {
      return 'You have a lower than normal boby weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'BMI Calculator', 
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Column(
        children: <Widget> [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateBoxColor(1);
                      });
                    },
                    child: ContainerLayout(
                      boxColor: maleBoxColor,
                      childWidget: DataContainer(icon: FontAwesomeIcons.mars, tittle: "Male",),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateBoxColor(0);
                      });
                    },
                    child: ContainerLayout(
                      boxColor: femaleBoxColor,
                      childWidget: DataContainer(icon: FontAwesomeIcons.venus, tittle: "Female",),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerLayout(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        'cm',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(children: <Widget>[
            Expanded(
                child: ContainerLayout(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WEIGHT',
                    style: textStyle1,
                  ),
                  Text(
                    weight.toString(),
                    style: textStyle2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        backgroundColor: activeColor,
                        child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            if (weight > 0) {
                              weight--;
                            }
                          });
                        },
                        backgroundColor: activeColor,
                        child:
                            Icon(FontAwesomeIcons.minus, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )),
            Expanded(
                child: ContainerLayout(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'AGE',
                    style: textStyle1,
                  ),
                  Text(
                    age.toString(),
                    style: textStyle2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                        backgroundColor: activeColor,
                        child: Icon(FontAwesomeIcons.plus, color: Colors.white),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            if (age > 0) {
                              age--;
                            }
                          });
                        },
                        backgroundColor: activeColor,
                        child:
                            Icon(FontAwesomeIcons.minus, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ])),
          GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  resultDetail = getInterpretation(bmi);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: inActiveColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            color: inActiveColor,
                            height: 200.0,
                            margin: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Result',
                                  style: textStyle1,
                                ),
                                Text(
                                  result.toString(),
                                  style: textStyle2,
                                ),
                                Text(
                                  resultDetail,
                                  style: textStyle1,
                                )
                              ],
                            ),
                          ),
                        );
                      });
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Calcuate',
                    style: textStyle3,
                  ),
                ),
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: EdgeInsets.only(top: 10.0),
              ))
        ],
      ),
    );
  }
}