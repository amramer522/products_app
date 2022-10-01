part of 'cubit.dart';

class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class ProductsLoadingState extends ProductsStates {}

class ProductsFailedState extends ProductsStates {
  final String msg;
  ProductsFailedState({required this.msg});
}

class ProductsSuccessState extends ProductsStates {
  final String msg;
  ProductsSuccessState({required this.msg});
}
