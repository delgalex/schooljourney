import 'package:flutter/material.dart';

class InputDecorations {

static InputDecoration authInputDecoration({
  required String hintText,
  required String labelText,
  IconData? pefixIcon
}){

  return InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue
              )
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2
              )
            ),
            hintText: hintText,
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.grey
            ),
            prefixIcon: pefixIcon != null 
            ? Icon( pefixIcon, color: Colors.blue )
            : null
      );
}

}