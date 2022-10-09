import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dio_helper.dart';
import 'model.dart';

part 'states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  static ProductsCubit get(context) => BlocProvider.of(context);
  final dioHelper = DioHelper();

  ProductsData? model;

  Future<void>getProducts() async {
    emit(GetProductsLoadingState());
    final resp = await dioHelper.getData(endPoint: "products");
    if (resp.statusCode == 200 && resp.data["status"]) {
      model = ProductsData.fromJson(resp.data);
      emit(GetProductsSuccessState(msg: resp.data["msg"]));
    } else {
      emit(GetProductsFailedState(msg: resp.data["msg"]));
    }
  }
}
