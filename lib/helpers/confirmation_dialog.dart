import 'package:flutter/material.dart';

Future<bool> getConfirmationDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Do you want to logout ?"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text("No")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text("Yes")),
            ],
          ),
        );
      }).then((value) => value ?? false);
}
