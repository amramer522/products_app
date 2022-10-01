import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: Builder(
          builder: (context) {
            final cubit = ProductsCubit.get(context);
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
