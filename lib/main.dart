import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/cubit/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubit/add_notes_cubit/bloc_observer/bloc_observer.dart';
import 'package:notes_app/cubit/notes_cubit/cubit/notes_cubit.dart';
import 'package:notes_app/shared/constants.dart';
import 'package:notes_app/splash_view/splash_view.dart';

import 'model/note_model.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotes);
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit(),
        ),
        BlocProvider(
          create: (context) => AddNotesCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const SplashView(),
      ),
    );
  }
}
