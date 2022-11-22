import 'package:flutter/material.dart';

import '../const.dart';

class ResultMessage extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData icon;
  const ResultMessage({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: SizedBox(
        height: 200,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            text,
            style: whiteTextStyle,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(5)),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
    ;
  }
}
