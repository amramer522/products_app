import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_app/core/input_validiator.dart';

import '../../shared_widgets/input.dart';
import 'cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        // showModalBottomSheet(builder: (context) => Container(
        //   height: 200,
        //   color: Colors.red,
        // ),context: context);
        return true;
      },
      child: BlocProvider(
        create: (context) => RegisterCubit(),
        child: Builder(builder: (context) {
          final cubit = RegisterCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: cubit.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            child: BlocBuilder<RegisterCubit, RegisterStates>(
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
                          label: "Enter Your Name",
                          controller: cubit.nameController,
                          validator: nameValidator,
                        ),
                        Input(
                          label: "Enter Your Phone",
                          controller: cubit.phoneController,
                          keyboardType: TextInputType.number,
                          validator: phoneValidator,
                        ),
                        Input(
                          label: "Enter Your Email",
                          controller: cubit.emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: emailValidator,
                        ),
                        Input(
                          label: "Enter Your Password",
                          controller: cubit.passwordController,
                          isPassword: true,
                          validator: passwordValidator,
                        ),
                        Input(
                          label: "Enter Your Confirm Password",
                          controller: cubit.confirmPasswordController,
                          isLastInput: true,
                          isPassword: true,
                          validator: confirmPassword,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: ElevatedButton(
                              onPressed: cubit.register, child: Text("Register")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
