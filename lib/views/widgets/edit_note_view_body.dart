import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keep_notes_app/views/widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: const [
          SizedBox(height: 40),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          )
        ],
      ),
    );
  }
}
