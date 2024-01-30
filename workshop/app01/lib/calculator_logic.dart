import 'package:get/get.dart';

class CalculatorLogic extends GetxController {
  var result = "".obs;
  var operator = "".obs;
  var operand = "".obs;

  void onNumberButtonPressed(int number) {
    result.value += number.toString();
  }

  void onOperatorButtonPressed(String operator) {
    if (this.operator.value == "") {
      this.operator.value = operator;
      operand.value = result.value;
      result.value = "";
    } else {
      this.operator.value = "";
    }
  }

  void onCalculateButtonPressed() {
    if (operator.value != "" && operand.value != "") {
      switch (operator.value) {
        case "+":
          result.value =
              (int.parse(operand.value) + int.parse(result.value)).toString();
          break;
        case "-":
          result.value =
              (int.parse(operand.value) - int.parse(result.value)).toString();
          break;
        case "x":
          result.value =
              (int.parse(operand.value) * int.parse(result.value)).toString();
          break;
        case "/":
          result.value =
              (int.parse(operand.value) / int.parse(result.value)).toString();
          break;
      }
      operator.value = "";
      operand.value = "";
    }
  }

  void clear() {
    result.value = "";
    operator.value = "";
    operand.value = "";
  }
}
