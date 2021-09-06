import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/db/databases.dart';
import 'package:flutter_application_1/data/models/note_models.dart';
import 'package:meta/meta.dart';

part 'crud_sqflite_state.dart';

class CrudSqfliteCubit extends Cubit<CrudSqfliteState> {
  CrudSqfliteCubit() : super(CrudSqfliteInitial());

  void createNote(Note note) async {
    emit(CreateSqfliteLoading());
    try {
      var createNote = await NotesDatabase.instance.create(note);
      if (createNote.desc!.isNotEmpty) {
        emit(CreateSqfliteSuccess('Success'));
      } else {
        emit(CreateSqfliteFailed('Failed'));
      }
    } catch (e) {
      emit(CreateSqfliteFailed(e.toString()));
    }
  }

  void fetchNote() async {
    emit(FetchSqfliteLoading());
    try {
      var readData = await NotesDatabase.instance.readAllNotes();
      if (readData.isNotEmpty) {
        emit(FetchSqfliteSuccess(readData));
      } else {
        emit(FetchSqfliteFailed('No Data'));
      }
    } catch (e) {
      emit(FetchSqfliteFailed(e.toString()));
    }
  }

  void deleteNote(int? id) async {
    emit(DeleteSqfliteLoading());
    try {
      var tryDelete = await NotesDatabase.instance.delete(id!);
      if (tryDelete == true) {
        emit(DeleteSqfliteSuccess('success delete'));
      } else {
        emit(DeleteSqfliteFailed('failed to delete data'));
      }
    } catch (e) {
      emit(DeleteSqfliteFailed(e.toString()));
    }
  }

  void updateNote(Note note) async {
    emit(UpdateSqfliteLoading());
    try {
      var updateNote = await NotesDatabase.instance.update(note);
      if (updateNote) {
        emit(UpdateSqfliteSuccess('Success update'));
      } else {
        emit(UpdateSqfliteFailed('Failed update'));
      }
    } catch (e) {
      emit(UpdateSqfliteFailed(e.toString()));
    }
  }
}
