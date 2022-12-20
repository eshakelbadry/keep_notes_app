import 'package:flutter/material.dart';
import 'package:keep_notes_app/views/notes_view.dart';
import 'package:keep_notes_app/views/widgets/notes_view_body.dart';

void main() {
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
