import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/data/models/user_model.dart';
import 'package:flutter_application_1/data/services/services.dart';
import 'package:meta/meta.dart';

part 'fetch_user_state.dart';

class FetchUserCubit extends Cubit<FetchUserState> {
  FetchUserCubit() : super(FetchUserInitial());
  ApiServices _services = ApiServices();
  void fetchUser() async {
    emit(FetchUserLoading());
    try {
      var dataUsers = await _services.getUsers();
      if (dataUsers.statusCode == 200) {
        for (Map data in dataUsers.data['results']) {
          emit(FetchUserSuccess(UsersModel.fromJson(data)));
        }
      } else {
        emit(FetchUserFailed('Failed To Load Data'));
      }
    } catch (e) {
      emit(FetchUserFailed(e.toString()));
    }
  }
}
