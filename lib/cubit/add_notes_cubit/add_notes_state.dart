part of 'add_notes_cubit.dart';

@immutable
abstract class AddNotesState {}

class AddNotesInitial extends AddNotesState {}

class LoadingToAddNotes extends AddNotesState {}

class SuccessToAddNotes extends AddNotesState {}

class FailedToAddNotes extends AddNotesState {
  final String err;

  FailedToAddNotes(this.err);
}
