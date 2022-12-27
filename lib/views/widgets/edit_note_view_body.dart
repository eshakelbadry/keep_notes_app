import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:keep_notes_app/views/widgets/custom_app_bar.dart';

import '../../models/note_model.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomAppBar(
            onPressed: (() {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }),
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(height: 40),
          CustomTextField(
              onChanged: ((value) {
                title = value;
              }),
              hint: widget.note.title),
          const SizedBox(height: 16),
          CustomTextField(
              onChanged: (value) {
                content = value;
              },
              hint: widget.note.subTitle,
              maxLines: 5),
        ],
      ),
    );
  }
}
