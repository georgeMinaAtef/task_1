
import 'package:e_comerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/login_model_2.dart';
import '../../repo/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);
  IconData passwordIcon = Icons.visibility;
  bool isPasswordHidden = true;
  bool isChecked = true;
  LoginModel2? loginModel;


  void changePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    isPasswordHidden
        ? passwordIcon = Icons.visibility
        : passwordIcon = Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }

  void changeChecked() {
    isChecked = !isChecked;
    emit(ChangeChecked());
  }

  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: 'api/test/user/login',
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel2.fromJson(value.data);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
