import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_notes/function/functions.dart';
import 'package:google_notes/model/notemode.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  TextEditingController titelController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: const [
                Icon(Icons.pin_drop_outlined),
                Gap(20),
                Icon(Icons.add_alert_outlined),
                Gap(20),
                Icon(Icons.system_update_alt),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
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
                  const Gap(10),
                  TextField(
                    maxLines: null,
                    controller: noteController,
                    decoration: const InputDecoration(
                      hintText: 'Note',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 675),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.add_box),
                  const Icon(Icons.palette),
                  const Icon(Icons.spellcheck),
                  TextButton(
                    onPressed: () {
                      saveData();
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future saveData() async {
    if (titelController.text.isNotEmpty && noteController.text.isNotEmpty) {
      final notes =
          Note(title: titelController.text, subNote: noteController.text);
      addData(notes);
      Navigator.pop(context);
    }
  }
}
