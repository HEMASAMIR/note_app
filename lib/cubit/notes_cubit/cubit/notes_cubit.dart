import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/shared/constants.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllData() {
    var notesBox = Hive.box<NoteModel>(kNotes);
    notes = notesBox.values.toList(); // get data
    emit(NotesSuccess());
  }
}
