import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helper_methods.dart';
import '../../core/input_validiator.dart';
import '../../shared_widgets/input.dart';
import 'cubit.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: Builder(
          builder: (context) {
            final cubit = AddProductCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text("Add Product"),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: cubit.chooseMyImage,
                          child: Container(
                            height: 100.h,
                            width: 100.h,
                            margin: EdgeInsets.only(top: 50.h),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green.withOpacity(.5)),
                            child: BlocBuilder<AddProductCubit, AddProductStates>(
                                builder: (context, state) {
                                  return Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      if (cubit.myImage != null)
                                        Image.file(
                                          cubit.myImage!,
                                          fit: BoxFit.contain,
                                        ),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        color: cubit.myImage != null
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                        Input(
                          label: "Enter Product title",
                          controller: cubit.titleController,
                        ),
                        Input(
                          label: "Enter Product Price",
                          controller: cubit.priceController,
                          keyboardType: TextInputType.number,
                        ),
                        Input(
                          label: "Enter Product Descrition",
                          controller: cubit.descriptionController,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: BlocConsumer<AddProductCubit, AddProductStates>(
                              listener: (context, state)
                              {
                                if (state is AddProductFailedState) {
                                  showMessage(msg: state.msg);
                                }
                                if (state is AddProductSuccessState) {
                                  showMessage(msg: state.msg);
                                }
                              }, builder: (context, state) {
                            if (state is AddProductLoadingState) {
                              return const CircularProgressIndicator();
                            }
                            return ElevatedButton(
                                onPressed: cubit.addProduct,
                                child: Text("Add Product"));
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
