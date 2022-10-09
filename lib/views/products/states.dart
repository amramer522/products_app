part of 'cubit.dart';

class ProductsStates {}

class ProductsInitialState extends ProductsStates {}

class GetProductsLoadingState extends ProductsStates {}

class GetProductsFailedState extends ProductsStates {
  final String msg;
  GetProductsFailedState({required this.msg});
}

class GetProductsSuccessState extends ProductsStates {
  final String msg;
  GetProductsSuccessState({required this.msg});
}
