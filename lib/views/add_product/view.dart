import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              body: Container(
                width: double.infinity,
              ),
            );
          }
      ),
    );
  }
}
