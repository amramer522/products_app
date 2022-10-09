import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dio_helper.dart';

part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  final dioHelper = DioHelper();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    emit(LoginLoadingState());
    final response = await dioHelper.sendData(
        endPoint: "intial/users/login",
        data: FormData.fromMap({
          "password": passwordController.text,
          "email": emailController.text,
        }));

    if (response.isSuccess) {
      emit(LoginSuccessState(response.msg));
    } else {
      emit(LoginFailedState(response.msg));
    }
  }
}
