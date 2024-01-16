
import '../../models/register_model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class ChangePasswordVisibility extends RegisterStates {}

class ChangePasswordVisibilityConfirm extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterModel registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}


class UpdateStep extends RegisterStates
{
   int step =0;
   UpdateStep({required this.step});
}

class UpdateUserType extends RegisterStates
{
   int userType =1;
   UpdateUserType({required this.userType});
}

class IncrementSalary extends RegisterStates
{
   int salary =1000;
   IncrementSalary({required this.salary});
}

class DecrementSalary extends RegisterStates
{
   int salary =1000;
   DecrementSalary({required this.salary});
}


class UpdateGender extends RegisterStates
{
   String gender = 'Male';
   UpdateGender({required this.gender});
}

class SocialMedia extends RegisterStates
{
  List<String> selectedSocialMedia =[];
  SocialMedia({required this.selectedSocialMedia});
}
