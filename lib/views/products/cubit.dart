import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dio_helper.dart';

part 'states.dart';

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(ProductsInitialState());

  static ProductsCubit get(context) => BlocProvider.of(context);
  final dioHelper = DioHelper();


}
