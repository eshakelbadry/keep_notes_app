import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keep_notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:keep_notes_app/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMod = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        const SizedBox(height: 32),
        CustomTextField(
          hint: 'title',
          onSaved: (value) {
            title = value;
          },
        ),
        const SizedBox(height: 16),
        CustomTextField(
            hint: 'content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            }),
        const SizedBox(height: 32),
        CustomButton(
          onTap: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              var noteModel = NoteModel(
                  title: title!,
                  subTitle: subTitle!,
                  date: DateTime.now().toString(),
                  color:Colors.blue.value);
              BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
            } else {
              autovalidateMod = AutovalidateMode.always;
              setState(() {});
            }
          },
        ),
        const SizedBox(height: 16),
      ]),
    );
  }
}
