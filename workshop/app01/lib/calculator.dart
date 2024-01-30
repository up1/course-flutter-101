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
            createCalculatorButton(text: "7", onTap: () => {}),
            createCalculatorButton(text: "8", onTap: () => {}),
            createCalculatorButton(text: "9", onTap: () => {}),
            createCalculatorButton(
                text: "x",
                onTap: () => {},
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            createCalculatorButton(text: "4", onTap: () => {}),
            createCalculatorButton(text: "5", onTap: () => {}),
            createCalculatorButton(text: "6", onTap: () => {}),
            createCalculatorButton(
                text: "/",
                onTap: () => {},
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            createCalculatorButton(text: "1", onTap: () => {}),
            createCalculatorButton(text: "2", onTap: () => {}),
            createCalculatorButton(text: "3", onTap: () => {}),
            createCalculatorButton(
                text: "+",
                onTap: () => {},
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        ),
        Row(
          children: [
            createCalculatorButton(
                text: "=",
                onTap: () => {},
                backgroundColor: Colors.orange,
                textColor: Colors.white),
            createCalculatorButton(text: "0", onTap: () => {}),
            createCalculatorButton(
                text: "C",
                onTap: () => {},
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
            createCalculatorButton(
                text: "-",
                onTap: () => {},
                backgroundColor: const Color.fromRGBO(220, 220, 220, 1)),
          ],
        )
      ]),
    );
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
