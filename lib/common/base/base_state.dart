import 'package:flutter_starter/common/base/base_exception.dart';

abstract class BaseState {}

class InitialState extends BaseState {}

class SuccessState extends BaseState {}

class ValueChangedState extends BaseState {}

class NavigateState extends BaseState {}

class DialogLoadingState extends BaseState {
  final String? message;
  DialogLoadingState({this.message});
}

class LoadingState extends BaseState {
  final int id;
  LoadingState({this.id = 0});
}

class ErrorState extends BaseState {
  final BaseException error;

  ErrorState({required this.error});
}
