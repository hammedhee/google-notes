import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_notes/function/functions.dart';
import 'package:google_notes/model/notemode.dart';

// ignore: must_be_immutable
class Edit extends StatefulWidget {
  String title;
  String subNote;
  int index;
  Edit(
      {super.key,
      required this.title,
      required this.subNote,
      required this.index});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController titelController = TextEditingController();
  TextEditingController notecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titelController = TextEditingController(text: titelController.text);
    notecontroller = TextEditingController(text: notecontroller.text);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              maxLines: null,
              controller: titelController,
              decoration: const InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 30, color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            Gap(20),
            TextField(
              maxLines: null,
              controller: notecontroller,
              decoration: const InputDecoration(
                hintText: 'Note',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
            Gap(40),
            IconButton(
                onPressed: () {
                  onEditBtn();
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.save,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }

  Future<void> onEditBtn() async {
    final titlee = titelController.text;
    final subNotee = notecontroller.text;

    final updateNote = Note(title: titlee, subNote: subNotee);
    editData(widget.index, updateNote);
  }
}
