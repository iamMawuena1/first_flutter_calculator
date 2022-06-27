import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = '0'; // INITITAL OUTPUT ON SCREEN

  // VARIABLES
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  // BUTTON PRESSED FUNCTION AND FUNCTIONALITY
  void buttonPressed(String buttonText) {
    if (buttonText == 'CLR') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '/' ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == '=') {
      num2 = double.parse(output);

      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'X') {
        _output == (num1 * num2).toString();
      }
      if (operand == '/') {
        _output == (num1 / num2).toString();
      }

      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  // NUMBER PAD STYLING
  Widget buildNumberPad(String buttonText) {
    return Expanded(
      child: Container(
        color: Colors.black45,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.transparent, //Color for the Border
              style: BorderStyle.solid, // Style on the border
              width: 0.1, //width of the border
            ),
            padding: const EdgeInsets.all(
              30.0, //Padding space for the number boxes
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black, //background color
          child: Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      //width: 1.0,
                    ),
                  ),
                  width:
                      MediaQuery.of(context).size.width, //Width of the screen
                  height: 200, //height of the screen
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 24.0,
                    horizontal: 12.0,
                  ),
                  child: Text(
                    output,
                    style: const TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Display on the screen
                    ),
                  ),
                ),
                const Divider(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        buildNumberPad('7'),
                        buildNumberPad('8'),
                        buildNumberPad('9'),
                        buildNumberPad('/'),
                      ],
                    ),
                    Row(
                      children: [
                        buildNumberPad('4'),
                        buildNumberPad('5'),
                        buildNumberPad('6'),
                        buildNumberPad('X'),
                      ],
                    ),
                    Row(
                      children: [
                        buildNumberPad('1'),
                        buildNumberPad('2'),
                        buildNumberPad('3'),
                        buildNumberPad('-'),
                      ],
                    ),
                    Row(
                      children: [
                        buildNumberPad('.'),
                        buildNumberPad('0'),
                        buildNumberPad('00'),
                        buildNumberPad('+'),
                      ],
                    ),
                    Row(
                      children: [
                        buildNumberPad('CLR'),
                        buildNumberPad('='),
                      ],
                    ),
                  ],
                ),
                const Text('@ iam_Mawuena'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
