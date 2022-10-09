part of 'cubit.dart';

class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginChangeImageState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginFailedState extends LoginStates {
  final String msg;

  LoginFailedState(this.msg);
}

class LoginSuccessState extends LoginStates {
  final String msg;

  LoginSuccessState(this.msg);
}