import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubit/notes_cubit/cubit/notes_cubit.dart';

import 'package:notes_app/layout/edit_notes/edit_noes.dart';
import 'package:notes_app/model/note_model.dart';

class BuildContainer extends StatelessWidget {
  const BuildContainer({
    Key? key,
    required this.note,
  }) : super(key: key);
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNotes(
                note: note,
              ),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(note.color!),
            borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: const EdgeInsets.only(top: 36.0, bottom: 36.0, left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title!,
                  style: const TextStyle(color: Colors.black, fontSize: 25.0),
                ),
                subtitle: Text(
                  note.subTitle!,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.4), fontSize: 20.0),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.grey.shade900,
                          icon: const Icon(
                            Icons.info,
                            color: Colors.grey,
                          ),
                          title: const Text(
                            'Are you sure you want to delete?',
                            style: TextStyle(color: Colors.white),
                          ),
                          content: Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    note.delete();
                                    BlocProvider.of<NotesCubit>(context)
                                        .fetchAllData();
                                    Navigator.pop(context);
                                  },
                                  child: const SizedBox(
                                      width: 60,
                                      child: Text(
                                        'Yes',
                                        textAlign: TextAlign.center,
                                      ))),
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const SizedBox(
                                  width: 60,
                                  child: Text(
                                    'No',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  note.date,
                  style: const TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
