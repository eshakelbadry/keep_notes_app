import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keep_notes_app/constants.dart';
import 'package:meta/meta.dart';

import '../../models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      emit(AddNoteSuccess());
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
