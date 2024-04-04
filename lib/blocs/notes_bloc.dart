import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/local/local_database.dart';
import '../data/model/note_model.dart';
import 'notes_event.dart';
import 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc() : super(LoadingState()) {
    on<NotesCallEvent>(_callNoteData);
    on<NotesDeleteEvent>(_deleteNote);
    on<NotesInsertEvent>(_insertNote);
    on<NotesUpdateEvent>(_updateNote);
    on<NotesSearchEvent>(_searchNote);
  }

  Future<void> _callNoteData(
      NotesCallEvent notesCallEvent, Emitter<NotesState> emit) async {
    emit(LoadingState());
    List<NoteModel> notes = await LocalDatabase.getAllNotes();
    emit(SuccessState(notesData: notes));
  }

  Future<void> _deleteNote(
      NotesDeleteEvent notesDeleteEvent, Emitter<NotesState> emit) async {
    emit(LoadingState());
    await LocalDatabase.deleteNotes(notesDeleteEvent.noteModel);
    add(NotesCallEvent());
  }

  Future<void> _insertNote(
      NotesInsertEvent notesInsertEvent, Emitter<NotesState> emit) async {
    emit(LoadingState());
    await LocalDatabase.insertNotes(notesInsertEvent.noteModel);
    add(NotesCallEvent());
  }

  Future<void> _updateNote(
      NotesUpdateEvent notesUpdateEvent, Emitter<NotesState> emit) async {
    emit(LoadingState());
    await LocalDatabase.updateNotes(noteModel: notesUpdateEvent.noteModel);
    add(NotesCallEvent());
  }

  Future<void> _searchNote(
      NotesSearchEvent notesSearchEvent, Emitter<NotesState> emit) async {
    emit(LoadingState());

    if (notesSearchEvent.title.isNotEmpty) {
      List<NoteModel> notes =
      await LocalDatabase.searchNotes(notesSearchEvent.title);
      emit(SuccessState(notesData: notes));
    } else {
      add(NotesCallEvent());
    }
  }
}