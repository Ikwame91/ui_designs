import 'package:calculator_app/buttons.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
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
            child: Container(),
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
                            color: Colors.green,
                            textColor: Colors.white,
                            buttonText: buttons[index]);
                      } else if (index == 1) {
                        return MyButtons(
                            color: Colors.red,
                            textColor: Colors.white,
                            buttonText: buttons[index]);
                      } else {
                        return MyButtons(
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
}
