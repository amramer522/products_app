import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_app/views/products/cubit.dart';
import 'package:product_app/views/products/view.dart';
import '../../core/helper_methods.dart';
import '../../core/input_validiator.dart';
import '../../shared_widgets/input.dart';
import 'cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        final cubit = LoginCubit.get(context);
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: BlocConsumer<LoginCubit, LoginStates>(
                      listener: (context, state) {
                    if (state is LoginFailedState) {
                      showMessage(msg: state.msg);
                    }
                    if (state is LoginSuccessState) {
                      showMessage(msg: state.msg);
                      navigateTo(page: ProductsView(), withHistory: false);
                    }
                  }, builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                        onPressed: cubit.login, child: Text("Login"));
                  }),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
