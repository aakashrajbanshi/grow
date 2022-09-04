import 'dart:io';

import 'package:classapp/helpers/image_picker_helper.dart';
import 'package:classapp/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  XFile? _pickedImage;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.attendance),
      ),
      body: Column(
        children: [
          Text(
            counter.count.toString(),
          ),
          TextButton(
            onPressed: () {
              counter.increaseCounter();
            },
            child: const Text(
              "Increase Count",
            ),
          ),
          TextButton(
            onPressed: () {
              counter.decreaseCounter();
            },
            child: const Text(
              "Decrease Count",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  builder: (context) {
                    return SizedBox(
                      // height: 220,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            onTap: () async {
                              Navigator.pop(context);
                              _pickedImage = await ImagePickerHelper()
                                  .pickImage(ImageSource.camera);
                              print(_pickedImage?.path);
                              setState(() {});
                            },
                            leading: const Icon(
                              Icons.camera_alt,
                            ),
                            title: const Text("Camera"),
                          ),
                          ListTile(
                            onTap: () async {
                              Navigator.pop(context);
                              _pickedImage = await ImagePickerHelper()
                                  .pickImage(ImageSource.gallery);
                              print(_pickedImage?.path);
                              setState(() {});
                            },
                            leading: const Icon(
                              Icons.photo_sharp,
                            ),
                            title: const Text("Gallery"),
                          )
                        ],
                      ),
                    );
                  });
            },
            child: const Text(
              "Pick an image",
            ),
          ),
          if (_pickedImage != null) ...{
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.file(
                  File(_pickedImage!.path),
                  height: 200,
                  fit: BoxFit.cover,
                  width: 250,
                ),
                IconButton(
                    onPressed: () {
                      _pickedImage = null;
                      setState(() {});
                    },
                    icon: const Icon(Icons.cancel))
              ],
            )
          }
        ],
      ),
    );
  }
}
