import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppSnacks {
  //to show snack bar
  static showSnackBar(BuildContext context, {String message = "Success"}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 300),
    ));
  }

// to show error toast
  static showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      fontSize: 20,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

// to show success toast
  static showSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 20,
      backgroundColor: Colors.green,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
