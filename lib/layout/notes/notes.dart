import 'package:flutter/material.dart';

import '../../shared/component/add_note/add_note.dart';
import '../../shared/component/notes_body/notes_body.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {

        return SafeArea(
          child: Scaffold(
            body: const NotesBody(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    context: context,
                    builder: (context) {
                      return const AddNote();
                    });
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      }
  }

