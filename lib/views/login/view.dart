import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(
          builder: (context) {
            final cubit = LoginCubit.get(context);
            return Scaffold(
              body: Container(
                width: double.infinity,
              ),
            );
          }
      ),
    );
  }
}
