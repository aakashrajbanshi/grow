import 'dart:developer';
import 'package:classapp/app/decorations/input_decoration.dart';
import 'package:classapp/app/widgets/screen_padding.dart';
import 'package:classapp/app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class AddDailyUpdateView extends StatefulWidget {
  const AddDailyUpdateView({Key? key}) : super(key: key);

  @override
  State<AddDailyUpdateView> createState() => _AddDailyUpdateViewState();
}

class _AddDailyUpdateViewState extends State<AddDailyUpdateView> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add daily update"),
      ),
      body: ScreenPadding(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            //This one's for date
            DefaultTextField(
              controller: _dateController,
              suffixIcon: InkWell(
                onTap: () async {
                  final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDate: DateTime.now().add(const Duration(days: 365)));
                  if (pickedDate != null) {
                    _dateController.text = pickedDate.toString();
                  }
                },
                child: const Icon(
                  Icons.calendar_month,
                ),
              ),
              labelText: "Date",
            ),

            const SizedBox(
              height: 20,
            ),
            //This one's for title
            DefaultTextField(
                controller: _titleController, labelText: "Enter a title"),
            const SizedBox(
              height: 20,
            ),
            DefaultTextField(
              controller: _descriptionController,
              labelText: "Description",
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                log(_dateController.text +
                    _titleController.text +
                    _descriptionController.text);
              },
              child: const Text(
                "Print",
              ),
            )
          ],
        ),
      ),
    );
  }
}
