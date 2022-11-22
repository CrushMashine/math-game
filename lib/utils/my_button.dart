import 'package:flutter/material.dart';
import '../const.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String numPad;
  var colorButton = Colors.deepPurple[400];
  MyButton({
    super.key,
    required this.numPad,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (numPad == 'C') {
      colorButton = Colors.green[500];
    } else if (numPad == 'DEL') {
      colorButton = Colors.red[500];
    } else if (numPad == '=') {
      colorButton = Colors.deepPurple[800];
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: colorButton,
          ),
          child: Center(
            child: Text(
              numPad,
              style: whiteTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
