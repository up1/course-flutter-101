import 'package:app01/button.dart';
import 'package:app01/result.dart';
import 'package:flutter/material.dart';
import 'package:app01/calculator_logic.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = "";
  String operator = "";
  String operand = "";

  final calculatorLogic = CalculatorLogic();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        ResultDisplay(result: result),
        Row(
          children: [
            createCalculatorButton(
                text: "7", onTap: () => onNumberButtonPressed(7)),
            createCalculatorButton(
                text: "8", onTap: () => onNumberButtonPressed(8)),
            createCalculatorButton(
                text: "9", onTap: () => onNumberButtonPressed(9)),
            createCalculatorButton(
                text: "x",
                onTap: () => {},
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            createCalculatorButton(
                text: "4", onTap: () => onNumberButtonPressed(4)),
            createCalculatorButton(
                text: "5", onTap: () => onNumberButtonPressed(5)),
            createCalculatorButton(
                text: "6", onTap: () => onNumberButtonPressed(6)),
            createCalculatorButton(
                text: "/",
                onTap: () => {},
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            createCalculatorButton(
                text: "1", onTap: () => onNumberButtonPressed(1)),
            createCalculatorButton(
                text: "2", onTap: () => onNumberButtonPressed(2)),
            createCalculatorButton(
                text: "3", onTap: () => onNumberButtonPressed(3)),
            createCalculatorButton(
                text: "+",
                onTap: () => onOperatorButtonPressed("+"),
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            createCalculatorButton(
                text: "=",
                onTap: () => onCalculateButtonPressed(),
                backgroundColor: Colors.orange,
                textColor: Colors.white),
            createCalculatorButton(text: "0", onTap: () => {}),
            createCalculatorButton(
                text: "C",
                onTap: () => clear(),
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
            createCalculatorButton(
                text: "-",
                onTap: () => onOperatorButtonPressed("-"),
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        )
      ]),
    );
  }

  void onNumberButtonPressed(int number) {
    calculatorLogic.onNumberButtonPressed(number);
    setResults();
  }

  void onOperatorButtonPressed(String operator) {
    calculatorLogic.onOperatorButtonPressed(operator);
    setResults();
  }

  void onCalculateButtonPressed() {
    calculatorLogic.onCalculateButtonPressed();
    setResults();
  }

  void clear() {
    calculatorLogic.clear();
    setResults();
  }

  void setResults() {
    setState(() {
      result = calculatorLogic.result;
      operand = calculatorLogic.operand;
      operator = calculatorLogic.operator;
    });
  }

  Widget createCalculatorButton(
      {required String text,
      required Function onTap,
      Color backgroundColor = Colors.white,
      Color textColor = Colors.black}) {
    return CalculatorButton(
      label: text,
      onTap: onTap as void Function(),
      size: 90,
      backgroundColor: backgroundColor,
      labelColor: textColor,
    );
  }
}
