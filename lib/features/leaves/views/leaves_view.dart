import 'package:flutter/material.dart';

class LeavesView extends StatefulWidget {
  const LeavesView({Key? key}) : super(key: key);

  @override
  State<LeavesView> createState() => _LeavesViewState();
}

class _LeavesViewState extends State<LeavesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Leaves"),
      ),
    );
  }
}
