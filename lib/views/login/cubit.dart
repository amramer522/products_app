import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/dio_helper.dart';

part 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  final dioHelper = DioHelper();


}
