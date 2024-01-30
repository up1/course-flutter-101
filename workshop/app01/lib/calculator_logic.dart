class CalculatorData {
  String result = "";
  String operator = "";
  String operand = "";
}

class CalculatorLogic {
  String result = "";
  String operator = "";
  String operand = "";

  void onNumberButtonPressed(int number) {
    result += number.toString();
  }

  void onOperatorButtonPressed(String operator) {
    if (this.operator == "") {
      this.operator = operator;
      operand = result;
      result = "";
    } else {
      this.operator = "";
    }
  }

  void onCalculateButtonPressed() {
    if (operator != "" && operand != "") {
      switch (operator) {
        case "+":
          result = (int.parse(operand) + int.parse(result)).toString();
          break;
        case "-":
          result = (int.parse(operand) - int.parse(result)).toString();
          break;
        case "x":
          result = (int.parse(operand) * int.parse(result)).toString();
          break;
        case "/":
          result = (int.parse(operand) / int.parse(result)).toString();
          break;
      }
      operator = "";
      operand = "";
    }
  }

  void clear() {
    result = "";
    operator = "";
    operand = "";
  }
}
