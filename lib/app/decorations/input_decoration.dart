import 'package:flutter/material.dart';

class InputFieldDecorations {
  //text field decorations
  static InputDecoration textfieldDecoration = const InputDecoration(
    hintText: "Hello",
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        style: BorderStyle.solid,
      ),
    ),
  );
}
