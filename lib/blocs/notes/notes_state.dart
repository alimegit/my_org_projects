

import '../../data/model/note_model.dart';

abstract class NotesState {}

class LoadingState extends NotesState {}

class SuccessState extends NotesState {
  List<NoteModel> notesData;
  SuccessState({required this.notesData});
}
