import 'dart:html';

import 'package:f_currency_converter_template/ui/pages/converter_page.dart';
import 'package:f_currency_converter_template/utils/constants.dart';
import 'package:flutter/material.dart';
import 'one_key.dart';

class KeyPad extends StatefulWidget {
  const KeyPad(
      {Key? key,
      required this.textCurrency1,
      required this.textCurrency2,
      required this.rate})
      : super(key: key);

  final String textCurrency1;
  final String textCurrency2;
  final double rate;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  double _currency2 = 0;

  int _currency1 = 0;

  void _onPressed(int k) {
    setState(() {
      if (k == 10) {
        _currency1 = 0;
        _currency2 = 0;
      } else {
        _currency1 = _currency1 * 10 + k;
        _currency2 = _currency1 * rates[currency1][currency2];
      }
    });
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);

    _currency2 = 0;
    _currency1 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.textCurrency1),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    _currency1.toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 35),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.textCurrency2),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    num.parse(_currency2.toStringAsFixed(4)).toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 35),
                  ))
            ],
          ),
          Theme(
            data: ThemeData(colorSchemeSeed: Color.fromARGB(255, 255, 59, 59)),
            child: Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    OneKey(number: 7, callback: _onPressed),
                    OneKey(number: 8, callback: _onPressed),
                    OneKey(number: 9, callback: _onPressed),
                  ]),
            ),
          ),
          Theme(
            data: ThemeData(colorSchemeSeed: Color.fromARGB(255, 255, 59, 59)),
            child: Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    OneKey(number: 4, callback: _onPressed),
                    OneKey(number: 5, callback: _onPressed),
                    OneKey(number: 6, callback: _onPressed),
                  ]),
            ),
          ),
          Theme(
            data: ThemeData(colorSchemeSeed: Color.fromARGB(255, 255, 59, 59)),
            child: Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    OneKey(number: 1, callback: _onPressed),
                    OneKey(number: 2, callback: _onPressed),
                    OneKey(number: 3, callback: _onPressed),
                  ]),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: MaterialButton(
                      key: const Key("reset"),
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                      //color: Theme.of(context).colorScheme.secondary,
                      color: Color.fromARGB(173, 29, 110, 22),
                      onPressed: () {
                        _onPressed(10);
                      },
                      child: const Text("Reset",
                          style: TextStyle(
                            fontSize: 26.0,
                            color: Colors.white,
                          ))),
                ),
              ),
              Theme(
                data: ThemeData(
                    colorSchemeSeed: Color.fromARGB(255, 255, 59, 59)),
                child: OneKey(number: 0, callback: _onPressed),
              )
            ]),
          )
        ]);
  }
}

int poner_numero() {
  return 1;
}
