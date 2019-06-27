import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.function});

  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: function,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      child: Icon(icon),
    );
  }
}
