import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Function callback;

  const CalcButton({required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: 75,
        height: 75,
        child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(width: 2, color: Colors.black)),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () => callback(text),
          color: Colors.tealAccent,
          textColor: Colors.black,
        ),
      ),
    );
  }
}
