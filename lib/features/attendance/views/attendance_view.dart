import 'dart:io';

import 'package:classapp/helpers/image_picker_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({Key? key}) : super(key: key);

  @override
  State<AttendanceView> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  XFile? _pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Attendance"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    backgroundColor: Colors.white,
                    builder: (context) {
                      return SizedBox(
                        // height: 250,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () async {
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
                "Pick an Image",
              )),
          if (_pickedImage != null) ...{
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.file(
                  File(_pickedImage!.path),
                  // height: 250,
                  fit: BoxFit.cover,
                  // width: 200,
                ),
                IconButton(
                    onPressed: () {
                      _pickedImage = null;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                    ))
              ],
            )
          }
        ],
      ),
    );
  }
}
