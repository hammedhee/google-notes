import 'package:flutter/material.dart';
import 'package:google_notes/model/notemode.dart';
import 'package:google_notes/view/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google Note's",
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
