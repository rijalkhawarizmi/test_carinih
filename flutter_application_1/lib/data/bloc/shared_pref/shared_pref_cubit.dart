import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/external/shared_pref.dart';
import 'package:meta/meta.dart';

part 'shared_pref_state.dart';

class SharedPrefCubit extends Cubit<SharedPrefState> {
  SharedPrefCubit() : super(SharedPrefInitial());

  SharedPref sharedPref = SharedPref();
  void shared() async {
    emit(SharedPrefLoading());
    try {
      var data = await sharedPref.getDataModel();

      if (data != null) {
        emit(SharedPrefNotEmpty());
      } else {
        emit(SharedPrefEmpty());
      }
    } catch (e) {
      emit(SharedPrefEmpty());
    }
  }
}
