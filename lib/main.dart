import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  _CalculatorState createState() {
    return _CalculatorState();
  }
}

class _CalculatorState extends State<Calculator> {
  String input = '';
  double num1 = 0;
  double num2 = 0;
  String operator = '';
  String result = '';

  void onNumberButtonPressed(String value) {
    setState(() {
      input += value;
    });
  }

  void onOperatorButtonPressed(String value) {
    if (input.isNotEmpty) {
      setState(() {
        num1 = double.parse(input);
        operator = value;
        input = '';
      });
    }
  }

  void calculateResult() {
    if (input.isNotEmpty) {
      num2 = double.parse(input);
      setState(() {
        if (operator == '+') {
          result = (num1 + num2).toString();
        } else if (operator == '-') {
          result = (num1 - num2).toString();
        } else if (operator == 'x') {
          result = (num1 * num2).toString();
        } else if (operator == '/') {
          if (num2 != 0) {
            result = (num1 / num2).toString();
          } else {
            result = 'Cannot divide by zero';
          }
        }
        num1 = 0;
        num2 = 0;
        operator = '';
        input = '';
      });
    }
  }

  void clear() {
    setState(() {
      input = '';
      num1 = 0;
      num2 = 0;
      operator = '';
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(title: const Text('Simple Calculator'),backgroundColor: Colors.black12),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                input.isNotEmpty ? input : result,
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),

          Row(
            children: [
              buildNumberButton('7'),
              buildNumberButton('8'),
              buildNumberButton('9'),
              buildOperatorButton('/'),
            ],
          ),
          Row(
            children: [
              buildNumberButton('4'),
              buildNumberButton('5'),
              buildNumberButton('6'),
              buildOperatorButton('x'),
            ],
          ),
          Row(
            children: [
              buildNumberButton('1'),
              buildNumberButton('2'),
              buildNumberButton('3'),
              buildOperatorButton('-'),
            ],
          ),
          Row(
            children: [
              buildNumberButton('0'),
              buildOperatorButton('+'),
              buildEqualButton(),
              buildClearButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNumberButton(String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),

      child: ElevatedButton(
        onPressed: () => onNumberButtonPressed(value),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12, fixedSize: const Size(80, 80)
        ),
        child: Text(value,
        style: const TextStyle(fontSize: 30),
        )
      ),
      ),
    );
  }

  Widget buildOperatorButton(String value) {
    return Expanded(
        child: Container(
        padding:const EdgeInsets.all(8.0),

    child: ElevatedButton(
        onPressed: () => onOperatorButtonPressed(value),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,fixedSize: const Size(80, 80)
        ),
        child: Text(value,
        style:const TextStyle(fontSize: 30),
        ),
    ),
      ),
    );
  }

  Widget buildEqualButton() {
    return Expanded(
        child: Container(
        padding: const EdgeInsets.all(8.0),

    child: ElevatedButton(
        onPressed: calculateResult,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,fixedSize: const Size(80, 80)
        ),
        child: const Text('=',
        style: TextStyle(fontSize: 30),
        ),
    ),
      ),
    );
  }

  Widget buildClearButton() {
    return Expanded(
        child: Container(
        padding: const EdgeInsets.all(8.0),

    child: ElevatedButton(
        onPressed: clear,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,fixedSize: const Size(80, 80)
        ),
        child: const Text('C',
        style: TextStyle(fontSize: 30),
        ),
    ),
      ),
    );
  }
}
