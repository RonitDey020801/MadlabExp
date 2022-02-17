import 'package:calculator/widgets/calc_button.dart';
import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int firstnum;
  late int secondnum;
  late String history;
  late String textToDisplay;
  late String res;
  late String operation;

  void btnOnClick(String btnVal) {
    print(btnVal);
    if (btnVal == 'C') {
      textToDisplay = '';
      firstnum = 0;
      secondnum = 0;
      res = '';
      history = '';
    } else if (btnVal == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '/' ||
        btnVal == '%') {
      firstnum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondnum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstnum + secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == '-') {
        res = (firstnum - secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == 'X') {
        res = (firstnum * secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == '/') {
        res = (firstnum / secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
      if (operation == '%') {
        res = (firstnum * secondnum * 0.01).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  void initState() {
    textToDisplay = '';
    history = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Calculator'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    history,
                    style: TextStyle(fontSize: 24, color: Colors.grey),
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    textToDisplay,
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                alignment: Alignment(1, 1),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton(text: 'C', callback: btnOnClick),
                  CalcButton(text: '%', callback: btnOnClick),
                  CalcButton(text: '<', callback: btnOnClick),
                  CalcButton(text: '/', callback: btnOnClick)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton(text: '7', callback: btnOnClick),
                  CalcButton(text: '8', callback: btnOnClick),
                  CalcButton(text: '9', callback: btnOnClick),
                  CalcButton(text: 'X', callback: btnOnClick)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton(text: '4', callback: btnOnClick),
                  CalcButton(text: '5', callback: btnOnClick),
                  CalcButton(text: '6', callback: btnOnClick),
                  CalcButton(text: '-', callback: btnOnClick)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton(text: '1', callback: btnOnClick),
                  CalcButton(text: '2', callback: btnOnClick),
                  CalcButton(text: '3', callback: btnOnClick),
                  CalcButton(text: '+', callback: btnOnClick)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalcButton(text: '00', callback: btnOnClick),
                  CalcButton(text: '0', callback: btnOnClick),
                  CalcButton(text: '.', callback: btnOnClick),
                  CalcButton(text: '=', callback: btnOnClick)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
