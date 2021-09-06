part of 'fetch_user_cubit.dart';

@immutable
abstract class FetchUserState {}

class FetchUserInitial extends FetchUserState {}

class FetchUserLoading extends FetchUserState {}

class FetchUserSuccess extends FetchUserState {
    final UsersModel usersModel;
    FetchUserSuccess(this.usersModel);
}

class FetchUserFailed extends FetchUserState {
  String messageFailed;
  FetchUserFailed(this.messageFailed);
}
