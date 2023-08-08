import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubit/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/model/note_model.dart';

import '../color_list_view/color_list_view.dart';
import '../custom_button/custom_button.dart';
import '../custom_text_field/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  var formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  bool iLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomTextField(
            hintText: 'Content',
            onSaved: (value) {
              subTitle = value;
            },
            maxLines: 5,
          ),
          const SizedBox(
            height: 32.0,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 16.0,
          ),
          //rebuild ui
          BlocBuilder<AddNotesCubit, AddNotesState>(
            builder: (context, state) {
              return CutomButtom(
                text: 'Add',
                isLoading: state is LoadingToAddNotes ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentData = DateTime.now();
                    var formattedTime =
                        DateFormat('dd-mm-yyyy').format(currentData);
                    var noteModel = NoteModel(
                      title: title,
                      subTitle: subTitle,
                      color: Colors.blue.value,
                      date: formattedTime,
                    );

                    BlocProvider.of<AddNotesCubit>(context).addNote(noteModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}


