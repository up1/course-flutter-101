import 'package:app01/button.dart';
import 'package:app01/result.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        ResultDisplay(result: result.toInt()),
        Row(
          children: [
            CalculatorButton(
              label: '7',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            ),
            CalculatorButton(
              label: '8',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            ),
            CalculatorButton(
              label: '9',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            )
          ],
        ),
        Row(
          children: [
            CalculatorButton(
              label: '4',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            ),
            CalculatorButton(
              label: '5',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            ),
            CalculatorButton(
              label: '6',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            )
          ],
        ),
        Row(
          children: [
            CalculatorButton(
              label: '1',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            ),
            CalculatorButton(
              label: '2',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            ),
            CalculatorButton(
              label: '3',
              onTap: () => {},
              size: 90,
              backgroundColor: Colors.white,
              labelColor: Colors.black,
            )
          ],
        )
      ]),
    );
  }
}
