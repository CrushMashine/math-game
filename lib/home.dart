import 'dart:math';

import 'package:flutter/material.dart';
import 'const.dart';
import 'utils/my_button.dart';
import 'utils/result_message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> numberPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
  ];
  int numberA = Random().nextInt(10);
  int numberB = Random().nextInt(10);

  // user answer
  String userAnswer = '';

  void buttonTapped(String button) {
    setState(() {
      if (button == '=') {
        if (userAnswer.isNotEmpty) {
          checkResult();
        }
      } else if (button == 'C') {
        userAnswer = '';
      } else if (button == 'DEL') {
        if (userAnswer.isNotEmpty) {
          userAnswer = userAnswer.substring(0, userAnswer.length - 1);
        }
      } else if (userAnswer.length < 3) {
        userAnswer += button;
      }
    });
  }

  void checkResult() {
    if (numberA + numberB == int.parse(userAnswer)) {
      showDialog(
          context: context,
          builder: ((context) {
            return ResultMessage(
                text: 'Correct!',
                onTap: goToNextQuestion,
                icon: Icons.arrow_forward);
          }));
    } else {
      showDialog(
          context: context,
          builder: ((context) {
            return ResultMessage(
                text: 'Sorry, try again',
                onTap: goBackToQuestion,
                icon: Icons.rotate_left);
          }));
    }
  }

  var randomNumber = Random();

  void goToNextQuestion() {
    setState(() {
      userAnswer = '';
    });
    numberA = randomNumber.nextInt(15);
    numberB = randomNumber.nextInt(15);

    Navigator.pop(context);
  }

  void goBackToQuestion() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Column(children: [
        // level progress
        Container(
          color: Colors.deepPurple,
          height: 160,
        ),
        // questions
        Expanded(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // question
                Text("$numberA + $numberB = ", style: whiteTextStyle),

                // answer box
                Container(
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[400],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(child: Text(userAnswer, style: whiteTextStyle)),
                ),
              ],
            ),
          ),
        ),
        // num pad
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GridView.builder(
                itemCount: numberPad.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return MyButton(
                    numPad: numberPad[index],
                    onTap: () => buttonTapped(numberPad[index]),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
