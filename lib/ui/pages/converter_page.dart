import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../widgets/key_pad.dart';
import '../widgets/selection_item.dart';

int currency1 = 1;
int currency2 = 0;

// un widget con estado en el cual mantenemos los dos indices
// de las monedas que vamos a convertir
class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  // el estado del widget

  String method2() {
    return "hola";
  }

  // función para construir el selector de monedas
  List<Widget> _buildItems() {
    return currencies
        .map((val) => SelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // El siguiente widget en el arbol es el Scaffold
    return Scaffold(
        appBar: AppBar(
          title: const Text('Convertidor de Moneda'),
        ),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                // selector para la primera moneda
                child: DirectSelect(
                    itemExtent: 45.0,
                    selectedIndex: currency1,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onSelectedItemChanged: (index) {
                      // aquí cambiamos el estado del widget
                      setState(() {
                        currency1 = index ?? 0;
                      });
                    },
                    items: _buildItems(),
                    child: SelectionItem(
                      isForList: false,
                      title: currencies[currency1],
                    )),
              ),
              Expanded(
                // selector para la segunda moneda
                child: DirectSelect(
                    itemExtent: 45.0,
                    selectedIndex: currency2,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        currency2 = index ?? 0;
                      });
                    },
                    items: _buildItems(),
                    child: SelectionItem(
                      isForList: false,
                      title: currencies[currency2],
                    )),
              ),
            ],
          ),
          Expanded(
            child: KeyPad(
                textCurrency1: currencies[currency1],
                textCurrency2: currencies[currency2],
                rate: 40),
          )
        ]));
  }
}
