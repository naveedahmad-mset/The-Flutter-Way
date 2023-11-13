import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  double _result = 0.0;

  final _fieldOneEditingController = TextEditingController();
  final _fieldTwoEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fieldOneEditingController.text = "0.0";
    _fieldTwoEditingController.text = "0.0";
  }

  void _calculate(int type) {

    setState(() {
      double valueOne = double.parse(_fieldOneEditingController.text == ""
          ? "0"
          : _fieldOneEditingController.text);
      double valueTwo = double.parse(_fieldTwoEditingController.text == ""
          ? "0"
          : _fieldTwoEditingController.text);

      switch (type) {
        case 1:
          _result = valueOne + valueTwo;
          break;
        case 2:
          _result = valueOne - valueTwo;
          break;
        case 3:
          _result = valueOne * valueTwo;
          break;
        case 4:
          if (valueTwo == 0.0) {
            _result = 0.0;
            return;
          }
          _result = valueOne / valueTwo;
          break;
        default:
          _result = 0.0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        const Text("CALCULATOR APP", style: TextStyle(fontSize: 24.0)),
        TextField(
              controller: _fieldOneEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter Number Here....',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+.?[0-9]*'))
              ],
            ),
            TextField(
              controller: _fieldTwoEditingController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter Number Here....',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+.?[0-9]*'))
              ],
            ),
            Text("RESULT: $_result"),
            Row(children: [
              Expanded(child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    _calculate(1);
                  },
                  child: const Text('SUM'),
                )),
                Expanded(child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  onPressed: () {
                    _calculate(2);
                  },
                  child: const Text('SUBTRACT'),
                )),
                Expanded(child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                  ),
                  onPressed: () {
                    _calculate(3);
                  },
                  child: const Text('PRODUCT'),
                )),
                Expanded(child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.cyan),
                  ),
                  onPressed: () {
                    _calculate(4);
                  },
                  child: const Text('DIVIDE'),
                ))
            ],)
      ],)
    );
  }
}
