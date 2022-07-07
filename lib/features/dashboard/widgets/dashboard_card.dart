import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String count;
  final Color? containerColor;

  const DashboardCard({
    Key? key,
    this.containerColor,
    required this.icon,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: containerColor != null ? containerColor : Colors.yellow,
        ),
        height: 80,
        alignment: Alignment.center,
        width: size.width * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [icon, Text(title), Text(count)],
        ));
  }
}
