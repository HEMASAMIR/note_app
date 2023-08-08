// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/cubit/notes_cubit.dart';

import 'package:notes_app/shared/component/custom_appBar/app_bar.dart';

import '../../../model/note_model.dart';
import '../custom_text_field/custom_text_field.dart';

class EditNotesBody extends StatefulWidget {
  const EditNotesBody({Key? key, required this.note})
      : super(
          key: key,
        );
  final NoteModel note;
  @override
  State<EditNotesBody> createState() => _EditNotesBodyState();
}

class _EditNotesBodyState extends State<EditNotesBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
        child: Column(
          children: [
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTitle ?? widget.note.subTitle;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchAllData();
              }, // save date , change it
              title: 'Edit Notes',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomTextField(
              hintText: widget.note.title,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomTextField(
              hintText: widget.note.subTitle,
              onChanged: (value) {
                subTitle = value;
              },
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
