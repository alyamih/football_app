import 'package:flutter/material.dart';
import 'package:football_app/model/notes.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key, required this.callBack, required this.note});
  final Function(Notes) callBack;
  final Notes note;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  TextEditingController controller = TextEditingController();
  Notes note = Notes();
  @override
  void initState() {
    super.initState();
    if (widget.note.text != null) {
      controller.text = widget.note.text!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 65, 16, 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.chevron_left,
                    ),
                    Text(
                      'Notes',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter'),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (widget.note.text == null) {
                    note.date = DateTime.now();
                    widget.callBack(note);
                  } else {
                    widget.callBack(note);
                  }
                  Navigator.pop(context);
                },
                child: const Text(
                  'Apply',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFF87112),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Inter'),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Column(
              children: [
                TextField(
                  maxLines: 1000,
                  onChanged: (value) {
                    if (widget.note.text == null) {
                      note.text = value;
                    } else {
                      widget.note.text = value;
                    }
                  },
                  style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400),
                  controller: controller,
                )
              ],
            ),
          )),
        )
      ]),
    );
  }
}
