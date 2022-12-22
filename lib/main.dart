import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keep_notes_app/constants.dart';
import 'package:keep_notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(kNotesBox);
  runApp(const KeepNotes());
}

class KeepNotes extends StatelessWidget {
  const KeepNotes({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: NotesView());
  }
}
