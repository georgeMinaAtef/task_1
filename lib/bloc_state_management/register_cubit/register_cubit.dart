
// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:e_comerce/bloc_state_management/register_cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/register_model.dart';
import '../../repo/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  IconData passwordIcon = Icons.visibility;
  bool isPasswordHidden = true;
  IconData passwordIcon2 = Icons.visibility;
  bool isPasswordHidden2 = true;


  void changePasswordVisibility() {
    isPasswordHidden = !isPasswordHidden;
    isPasswordHidden
        ? passwordIcon = Icons.visibility
        : passwordIcon = Icons.visibility_off;
    emit(ChangePasswordVisibility());
  }


  void changePasswordVisibilityConfirm() {
    isPasswordHidden2 = !isPasswordHidden2;
    isPasswordHidden2
        ? passwordIcon2 = Icons.visibility
        : passwordIcon2 = Icons.visibility_off;
    emit(ChangePasswordVisibilityConfirm());
  }

  RegisterModel? registerModel;

  void registerUser({
    required String first_name,
    required String last_name ,
    required String about ,
    List<num>? tags ,
    required num salary ,
    List<String>? favorite_social_media ,
    required String email,
    required String password,
    required String password_confirmation,
    required String birth_date,
    required bool gender,
    num? type,
    File? avatar,

  }) async {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: 'https://test.kafiil.com/api/test/user/register',
      data: {
        'first_name': first_name,
        'last_name': last_name,
        'about': about,
        'tags': tags,
        'salary': salary,
        'favorite_social_media': favorite_social_media,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
        'gender': gender,
        'type': type,
        'avatar': avatar,
      }
    ).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      print(registerModel!.message);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }


  int currentStep = 0;

  void updateStep(int steps)
  {
    currentStep = steps;
    emit(UpdateStep(step: currentStep));
  }

  int userType = 1;

  void updateUserType(int type)
  {
    userType = type;
    emit(UpdateUserType(userType: userType));
  }

  int salary = 1000;

  void decrementSalary(int s)
  {
    salary -= s;
    emit(DecrementSalary(salary: salary));
  }

  void incrementSalary(int s)
  {
    salary += s;
    emit(IncrementSalary(salary: salary));
  }


  String gender='Male';

void updateGender(g)
  {
     gender = g ;
    emit(UpdateGender(gender: gender));
  }


  List<String> selectedSocialMedia = [];
  final List<String> socialMediaPlatforms = ['Facebook', 'Linked In', 'Twitter'];
  final List<String> socialMediaIcons= ['assets/images/facebook.jpg','assets/images/liked_in.png','assets/images/twitter.png'];


  void updateSocialMedia(String socialMedia, bool isSelected) {
    final List<String> updatedList = List.from(selectedSocialMedia);
    if (isSelected) {
      updatedList.add(socialMedia);
    } else {
      updatedList.remove(socialMedia);
    }
    selectedSocialMedia = updatedList;
    emit(SocialMedia(selectedSocialMedia: selectedSocialMedia));
  }

}
