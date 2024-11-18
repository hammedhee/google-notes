import 'package:flutter/material.dart';
import 'package:google_notes/model/notemode.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<Note>> noteNotifire = ValueNotifier([]);

Future addData(Note value) async {
  final noteDb = await Hive.openBox<Note>('notebox');
  await noteDb.add(value);
  noteNotifire.value.add(value);
  noteNotifire.notifyListeners();
}

Future getAllData() async {
  final noteDb = await Hive.openBox<Note>('notebox');
  noteNotifire.value.clear();
  noteNotifire.value.addAll(noteDb.values);
  noteNotifire.notifyListeners();
}

Future deleteData(int index) async {
  final noteDb = await Hive.openBox<Note>('notebox');
  await noteDb.deleteAt(index);
  getAllData();
}

Future editData(index, Note value) async {
  final noteDb = await Hive.openBox<Note>('notebox');
  noteNotifire.value.clear();
  noteNotifire.value.addAll(noteDb.values);
  noteNotifire.notifyListeners();
  noteDb.putAt(index, value);
  getAllData();
}
