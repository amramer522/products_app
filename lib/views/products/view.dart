import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/core/helper_methods.dart';
import 'package:product_app/views/add_product/view.dart';
import 'cubit.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: Builder(builder: (context) {
        final cubit = ProductsCubit.get(context);
        cubit.getProducts();
        return Scaffold(
          appBar: AppBar(title: Text("Products")),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigateTo(page: AddProductView());
            },
            child: Icon(Icons.add),
          ),
          body: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ProductsCubit, ProductsStates>(
                    builder: (context, state) {
                  if (state is GetProductsLoadingState) {
                    return const CircularProgressIndicator();
                  } else if (state is GetProductsFailedState) {
                    return Text(state.msg);
                  } else {
                    return Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async{
                          await Future.delayed(Duration(seconds: 2));
                          cubit.getProducts();
                        },
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Card(
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("Title"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(cubit
                                          .model!.data.records[index].title),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text("Price"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(cubit
                                          .model!.data.records[index].price),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          itemCount: cubit.model!.data.records.length,
                        ),
                      ),
                    );

                    // return Text(cubit.model!.data.records.length
                    //     .toString());
                  }
                })
              ],
            ),
          ),
        );
      }),
    );
  }
}
