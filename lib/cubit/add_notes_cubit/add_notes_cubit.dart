import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/shared/constants.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color color = const Color(0xff042a2b);
  addNote(NoteModel note) async {
    try {
      note.color = color.value;
      emit(LoadingToAddNotes());
      var notesBox = Hive.box<NoteModel>(kNotes);
      await notesBox.add(note);
      debugPrint('Successs');
      emit(SuccessToAddNotes());
    } catch (e) {
      debugPrint('Failed... : ${e.toString()}');
      emit(FailedToAddNotes(e.toString()));
    }
  }
}
