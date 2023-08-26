import 'package:flutter/material.dart';

import 'soft_squared_button.dart';

class ValueAdjuster extends StatelessWidget {
  final int value;
  final void Function(int) onValueChange;

  const ValueAdjuster(
      {super.key, required this.onValueChange, required this.value});

  void _incrementCounter() {
    onValueChange(value + 1);
  }

  void _decrementCounter() {
    onValueChange(value - 1);
  }

  Widget get _addButton => SoftSquaredButton(
        width: 75,
        height: 30,
        onPressed: _incrementCounter,
        child: const Text('Add',
            style: TextStyle(
                color: Color(0xFF48c45c),
                fontSize: 12,
                fontWeight: FontWeight.w700)),
      );

  Widget get _plusButton => SoftSquaredButton(
        onPressed: _incrementCounter,
        child: const Text('+',
            style: TextStyle(
                color: Color(0xFF48c45c),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      );

  Widget get _minusButton => SoftSquaredButton(
        onPressed: _decrementCounter,
        child: const Text('-',
            style: TextStyle(
                color: Color(0xFF9b9896),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
      );

  Widget get _countIndicatorTitle => Text(
        value.toString(),
        style: const TextStyle(
            color: Color(0xFF48c45c),
            fontSize: 12,
            fontWeight: FontWeight.w800),
      );

  Widget get _addButtonOrValueIncrementorRow => value > 0
      ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _minusButton,
            _countIndicatorTitle,
            _plusButton,
          ],
        )
      : Center(
          child: _addButton,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF48c45c), width: 1.5),
      ),
      child: _addButtonOrValueIncrementorRow,
    );
  }
}
