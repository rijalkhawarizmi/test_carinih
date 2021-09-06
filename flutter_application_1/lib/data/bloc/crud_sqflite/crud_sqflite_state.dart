part of 'crud_sqflite_cubit.dart';

@immutable
abstract class CrudSqfliteState {}

class CrudSqfliteInitial extends CrudSqfliteState {}

class CreateSqfliteLoading extends CrudSqfliteState {}

class CreateSqfliteSuccess extends CrudSqfliteState {
  final String messageSuccess;
  CreateSqfliteSuccess(this.messageSuccess);
}

class CreateSqfliteFailed extends CrudSqfliteState {
  final String messageFailed;

  CreateSqfliteFailed(this.messageFailed);
}

class FetchSqfliteLoading extends CrudSqfliteState {}

class FetchSqfliteSuccess extends CrudSqfliteState {
  final List<Note> listNote;
  FetchSqfliteSuccess(this.listNote);
}

class FetchSqfliteFailed extends CrudSqfliteState {
  final String messageFailed;

  FetchSqfliteFailed(this.messageFailed);
}


class DeleteSqfliteLoading extends CrudSqfliteState {}

class DeleteSqfliteSuccess extends CrudSqfliteState {
  final String messageSuccess;
  DeleteSqfliteSuccess(this.messageSuccess);
}

class DeleteSqfliteFailed extends CrudSqfliteState {
  final String messageFailed;

  DeleteSqfliteFailed(this.messageFailed);
}



class UpdateSqfliteLoading extends CrudSqfliteState {}

class UpdateSqfliteSuccess extends CrudSqfliteState {
  final String messageSuccess;
  UpdateSqfliteSuccess(this.messageSuccess);
}

class UpdateSqfliteFailed extends CrudSqfliteState {
  final String messageFailed;

  UpdateSqfliteFailed(this.messageFailed);
}