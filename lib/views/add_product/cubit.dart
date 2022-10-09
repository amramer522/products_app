import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/dio_helper.dart';

part 'states.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);
  final dioHelper = DioHelper();
  File? myImage;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  void chooseMyImage() {
    ImagePicker.platform.getImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        myImage = File(value.path);
        emit(AddProductChangeImageState());
      }
    });
  }

  void addProduct() async {
    emit(AddProductLoadingState());

    final response = await dioHelper.sendData(
        endPoint: "products",
        data: FormData.fromMap({
          "title": titleController.text,
          "_method": "DELETE",
          "active": 1,
          "price": priceController.text,
          "description": descriptionController.text,
          "image[]": myImage != null
              ? MultipartFile.fromFileSync(myImage!.path,
                  filename: myImage!.path.split("/").last)
              : null,
          "category_id": 3,
        }));
    if (response.isSuccess) {
      emit(AddProductSuccessState(response.msg));
    } else {
      emit(AddProductFailedState(response.msg));
    }
  }
}
