import 'package:flutter/material.dart';

import '../../model/note_model.dart';
import '../../shared/component/edit_note_body/edit_notes_body.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNotesBody(
        note: note,
      ),
    );
  }
}
