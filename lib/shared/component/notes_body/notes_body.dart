import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:notes_app/shared/component/custom_note_mode/custom_note_model.dart';

import '../custom_appBar/app_bar.dart';

class NotesBody extends StatefulWidget {
  const NotesBody({super.key});

  @override
  State<NotesBody> createState() => _NotesBodyState();
}

class _NotesBodyState extends State<NotesBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is SuccessToAddNotes) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
          child: Column(
            children: [
              CustomAppBar(
                title: 'Notes',
                icon: Icons.search,
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomListView()
            ],
          ),
        );
      },
    );
  }
}
