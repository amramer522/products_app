import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dio_helper.dart';

part 'states.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitialState());

  static AddProductCubit get(context) => BlocProvider.of(context);
  final dioHelper = DioHelper();


}
