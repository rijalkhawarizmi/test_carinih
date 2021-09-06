part of 'shared_pref_cubit.dart';

@immutable
abstract class SharedPrefState {}

class SharedPrefInitial extends SharedPrefState {}
class SharedPrefLoading extends SharedPrefState {}
class SharedPrefNotEmpty extends SharedPrefState {}
class SharedPrefEmpty extends SharedPrefState {}
