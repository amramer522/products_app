part of 'cubit.dart';

class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterChangeImageState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterFailedState extends RegisterStates {
  final String msg;

  RegisterFailedState(this.msg);
}

class RegisterSuccessState extends RegisterStates {
  final String msg;

  RegisterSuccessState(this.msg);
}
