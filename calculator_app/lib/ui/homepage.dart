import 'package:calculator_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                  Container(
                      padding: const EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(),
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        return MyButtons(
                            onTap: () {
                              setState(() {
                                userQuestion = '';
                                userAnswer = '';
                              });
                            },
                            color: Colors.green,
                            textColor: Colors.white,
                            buttonText: buttons[index]);
                      } else if (index == 1) {
                        return MyButtons(
                            onTap: () {
                              setState(() {
                                if (userQuestion.isNotEmpty) {
                                  userQuestion = userQuestion.substring(
                                      0, userQuestion.length - 1);
                                }
                              });
                            },
                            color: Colors.red,
                            textColor: Colors.white,
                            buttonText: buttons[index]);
                      } else if (index == buttons.length - 1) {
                        return MyButtons(
                            onTap: () {
                              setState(() {
                                calculate();
                              });
                            },
                            color: Colors.orange,
                            textColor: Colors.white,
                            buttonText: buttons[index]);
                      } else {
                        return MyButtons(
                            onTap: () {
                              setState(() {
                                userQuestion += buttons[index];
                              });
                            },
                            color: isOperator(buttons[index])
                                ? Colors.orange
                                : Colors.white,
                            textColor: isOperator(buttons[index])
                                ? Colors.white
                                : Colors.orange,
                            buttonText: buttons[index]);
                      }
                    }),
              ))
        ],
      ),
    );
  }

  bool isOperator(String operator) {
    if (operator == '%' ||
        operator == '/' ||
        operator == 'x' ||
        operator == '-' ||
        operator == '+' ||
        operator == '=') {
      return true;
    }
    return false;
  }

  void calculate() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    finalQuestion = finalQuestion.replaceAll('%', '/100');
    try {
      Parser p = Parser();
      Expression exp = p.parse(finalQuestion);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      userAnswer = eval.toString();
    } catch (e) {
      userAnswer = 'Error';
    }
  }
}
