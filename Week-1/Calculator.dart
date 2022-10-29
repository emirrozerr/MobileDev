import 'dart:convert';
import 'dart:io';
import 'dart:math';

class Calc {

  double num1 = 0;
  double num2 = 0;

  
  Calc(double firstNum, double secondNum) {
    this.num1 = firstNum;
    this.num2 = secondNum;
  }

 
  double add(double firstNum, double secondNum) {
    return firstNum + secondNum;
  }

  double subtract(double firstNum, double secondNum) {
    return firstNum - secondNum;
  }

  double multiply(double firstNum, double secondNum) {
    return firstNum * secondNum;
  }


  double divide(double firstNum, double secondNum) {
    return firstNum / secondNum;
  }

  static void backToMainMenu() {
    print("\nReturning to main menu...\n");
    wholeThing();
  }

  static void wholeThing() {
    print("""
        \nWelcome to the Dart Calculator!
        \n=============================== 
        \nThis calculator performs operations on two numbers. 
        \nPlease type your first number \nType 'exit' to exit at anytime! \n""");

    String? firstInput = stdin.readLineSync();
    firstInput = firstInput?.trim();
    double firstNum = 0.0;

    if (firstInput == "exit") {
      exit(0);
    } else {
      firstNum = double.parse(firstInput!);
    }

    print("\nGreat! Now input your second number.\n");

    String? secondInput = stdin.readLineSync();

    secondInput = secondInput?.trim();
    double secondNum = 0.0;

    if (secondInput == "exit") {
      exit(0);
    } else {
      secondNum = double.parse(secondInput!);
    }

    Calc calc1 = new Calc(firstNum, secondNum);

    print("""\nAwesome! Now, choose the operation you want.
    \nType + for addition
    \nType - for subtraction
    \nType * for multiplication
    \nType / to divide""");

    String? operator = stdin.readLineSync();
    operator = operator?.trim();

    switch (operator) {
      case "+":
        print("${calc1.num1} plus ${calc1.num2} equals = ${calc1.add(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "-":
        print("${calc1.num1} minus ${calc1.num2} equals = ${calc1.subtract(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "*":
        print("${calc1.num1} multiplied by ${calc1.num2} equals = ${calc1.multiply(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "/":
        print("${calc1.num1} divided by ${calc1.num2} equals = ${calc1.divide(firstNum, secondNum)}");
        backToMainMenu();
        break;
      case "exit":
        exit(0);
        break;
      default:
        print("Input not recognized.");
        backToMainMenu();
        break;
    }
  }
}


void main(List<String> args) {
  Calc.wholeThing();
}