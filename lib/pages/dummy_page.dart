import 'package:classapp/constants/image_constants.dart';
import 'package:classapp/models/dummy_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DummyPage extends StatefulWidget {
  final DummyPageModel data;
  const DummyPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.data.age}"),
      ),
      body: Center(
        child: SvgPicture.asset(
          ImageConstants.sloth,
          height: 200,
        ),
      ),
    );
  }
}
