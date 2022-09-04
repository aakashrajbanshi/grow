import 'package:flutter/material.dart';

class DefaultTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const DefaultTextField({
    Key? key,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    required this.labelText,
  }) : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: const EdgeInsets.all(5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
