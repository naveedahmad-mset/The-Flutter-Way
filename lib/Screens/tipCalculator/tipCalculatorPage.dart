import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TipCalculatorPage extends StatefulWidget {

  const TipCalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<TipCalculatorPage> createState() => _TipCalculatorPageState();
}

class _TipCalculatorPageState extends State<TipCalculatorPage> {

  final _textEditingController = TextEditingController();

  double _currentSliderValue = 0;
  String _tipAmount = "0.00";

  void calculateTip(double tipPercentage, double billAmount) {

    setState(() {
      
      double tipAmountDouble = ( billAmount / 100.0 ) * tipPercentage;
      _tipAmount = tipAmountDouble.toStringAsFixed(2);
    });
  }

  @override
  void initState() {
   
   super.initState();
   _textEditingController.addListener(() {calculateTip(_currentSliderValue, double.parse(_textEditingController.text == "" ? "0" : _textEditingController.text));});
  }

  @override
  void dispose() {

    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Enter Bill Amount',
              style: TextStyle(fontSize: 25)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: TextField(
                controller: _textEditingController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Enter Bill Amount',
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+.?[0-9]*'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 100,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {

                  setState(() {

                    _currentSliderValue = value;
                    calculateTip(_currentSliderValue, double.parse(_textEditingController.text == "" ? "0" : _textEditingController.text));
                  });
                },
              )
            ),
            const Text(
              'Here is the Tip Amount',
            ),
            Text(
              _tipAmount,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
