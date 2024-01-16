
import 'package:e_comerce/models/login_model_2.dart';


abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangePasswordVisibility extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel2 loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class ChangeChecked extends LoginStates {}