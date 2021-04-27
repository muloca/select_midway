import 'package:flutter/material.dart';
import 'package:selection/component/selection_card.dart';

enum SingingCharacter { dinheiro, cartao }

class SelectionComponent extends StatefulWidget {
  @override
  _SelectionComponentState createState() => _SelectionComponentState();
}

class _SelectionComponentState extends State<SelectionComponent> {
  List<bool> _selections = List.generate(3, (index) => false);

  SingingCharacter _character = SingingCharacter.dinheiro;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [SelectCard(), SelectCard(), SelectCard()],
      isSelected: _selections,
      onPressed: (int index) {
        setState(() {
          _selections[index] = !_selections[index];
        });
      },
    );
  }
}
