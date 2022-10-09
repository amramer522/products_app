import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_app/core/helper_methods.dart';

import '../../core/dio_helper.dart';

part 'states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  final dioHelper = DioHelper();

  File? myImage;
  final nameController = TextEditingController(text: "ahme");
  final phoneController = TextEditingController(text: "010275450235");
  final emailController = TextEditingController(text: "amraer@gmail.com");
  final passwordController = TextEditingController(text: "123456789");
  final confirmPasswordController = TextEditingController(text: "123456789");
  final formKey = GlobalKey<FormState>();

  void chooseMyImage() {
    ImagePicker.platform.getImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        myImage = File(value.path);
        emit(RegisterChangeImageState());
      }
    });
  }

  void register() async {
    emit(RegisterLoadingState());

    final response = await dioHelper
        .sendData(
            endPoint: "intial/users/register",
            data: FormData.fromMap({
              "email": emailController.text,
              "password": passwordController.text,
              "phone": phoneController.text,
              "image": myImage!=null?
              MultipartFile.fromFileSync(myImage!.path,
                  filename: myImage!.path.split("/").last):null,
              "name": nameController.text,
            }));
    if (response.isSuccess) {
      emit(RegisterSuccessState(response.msg));
    } else {
      emit(RegisterFailedState(response.msg));
    }
  }
}
