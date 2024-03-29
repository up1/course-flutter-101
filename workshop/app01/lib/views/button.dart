import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {Key? key,
      required this.label,
      required this.onTap,
      required this.size,
      this.backgroundColor = Colors.white,
      this.labelColor = Colors.black})
      : super(key: key);

  final String label;
  final VoidCallback onTap;
  final double size;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            width: size,
            height: size,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, offset: Offset(1, 1), blurRadius: 1),
                ],
                borderRadius: BorderRadius.all(Radius.circular(size / 2)),
                color: backgroundColor),
            child: InkResponse(
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
              onTap: onTap,
              child: Center(
                  child: Text(
                label,
                style: TextStyle(fontSize: 24, color: labelColor),
              )),
            ),
          ),
        ));
  }
}
