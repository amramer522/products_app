part of 'cubit.dart';

class AddProductStates {}

class AddProductInitialState extends AddProductStates {}

class AddProductChangeImageState extends AddProductStates {}


class AddProductLoadingState extends AddProductStates {}

class AddProductFailedState extends AddProductStates {
  final String msg;

  AddProductFailedState(this.msg);
}

class AddProductSuccessState extends AddProductStates {
  final String msg;

  AddProductSuccessState(this.msg);
}
