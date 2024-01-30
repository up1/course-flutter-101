import 'package:flutter/material.dart';

class ResponsiveCalculatorScreen extends StatefulWidget {
  const ResponsiveCalculatorScreen({super.key});

  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<ResponsiveCalculatorScreen> {
  String _output = '0';
  String _previousInput = '';
  String _currentInput = '';
  String _operation = '';

  void _onButtonPressed(String buttonText) {
    String newOutput = _output;
    String newPreviousInput = _previousInput;
    String newCurrentInput = _currentInput;
    String newOperation = _operation;

    if (buttonText == 'C') {
      newOutput = '0';
      newPreviousInput = '';
      newCurrentInput = '';
      newOperation = '';
    } else if ('+-x/'.contains(buttonText)) {
      if (newCurrentInput.isNotEmpty) {
        newPreviousInput = newOutput;
        newOperation = buttonText;
        newCurrentInput = '';
      }
    } else if (buttonText == '=') {
      if (newPreviousInput.isNotEmpty &&
          newOperation.isNotEmpty &&
          newCurrentInput.isNotEmpty) {
        double result = 0.0;
        double num1 = double.parse(newPreviousInput);
        double num2 = double.parse(newCurrentInput);

        switch (newOperation) {
          case '+':
            result = num1 + num2;
            break;
          case '-':
            result = num1 - num2;
            break;
          case 'x':
            result = num1 * num2;
            break;
          case '/':
            result = num2 != 0 ? num1 / num2 : double.infinity;
            break;
        }

        newOutput = result.toString();
        newPreviousInput = '';
        newOperation = '';
        newCurrentInput = '';
      }
    } else {
      newCurrentInput += buttonText;
      newOutput = newCurrentInput;
    }

    // Update the state only once
    setState(() {
      _output = newOutput;
      _previousInput = newPreviousInput;
      _currentInput = newCurrentInput;
      _operation = newOperation;
    });
  }

  Widget _buildButton(String buttonText) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Check the orientation of the device
    Orientation orientation = MediaQuery.of(context).orientation;

    // Create a widget for the display
    Widget display = Expanded(
      flex:
          1, // Takes 1 part of the screen in landscape or the full width in portrait
      child: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.bottomRight,
        child: Text(
          _output,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    // Create a widget for the button grid
    Widget buttonGrid = Expanded(
      flex: orientation == Orientation.portrait
          ? 2
          : 1, // Takes 2 parts of the screen in landscape or the full height in portrait
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: <String>[
          '7',
          '8',
          '9',
          '/',
          '4',
          '5',
          '6',
          'x',
          '1',
          '2',
          '3',
          '-',
          'C',
          '0',
          '=',
          '+',
        ].map((buttonText) => _buildButton(buttonText)).toList(),
      ),
    );

    return Scaffold(
      body: orientation == Orientation.portrait
          ? Column(
              children: [
                display,
                buttonGrid,
              ],
            )
          : Row(
              children: [
                display,
                buttonGrid,
              ],
            ),
    );
  }
}
