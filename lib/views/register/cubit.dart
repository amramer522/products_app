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
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void chooseMyImage() {
    ImagePicker.platform.getImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        myImage = File(value.path);
        emit(RegisterChangeImageState());
      }
    });
  }

  void register() {
    if (formKey.currentState!.validate()) {
      if (myImage != null) {
        dioHelper.sendData(
            endPoint: "intial/users/register",
            data: FormData.fromMap({
              "email": emailController.text,
              "password": passwordController.text,
              "phone": phoneController.text,
              "image": MultipartFile.fromFileSync(myImage!.path),
              "name": nameController.text,
            }));
      } else {
        ScaffoldMessenger.of(navigatorKey.currentContext!)
            .showSnackBar(SnackBar(
          backgroundColor: Colors.green.withOpacity(.5),
                elevation: 0,
                content: Row(
          children: [
            Icon(
              Icons.message,
              color: Colors.black,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text("Please Select Image First",style: TextStyle(color: Colors.black),),
          ],
        )));
      }
    }
  }
}
