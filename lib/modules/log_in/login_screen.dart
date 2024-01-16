
import 'package:e_comerce/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../bloc_state_management/login_cubit/login_cubit.dart';
import '../../bloc_state_management/login_cubit/login_states.dart';
import '../../layouts/home_layout.dart';
import '../../network/local/cash_helper.dart';
import '../../shared/components/custom_elevated_button.dart';
import '../../shared/components/custom_text_field.dart';
import '../register_module/register.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status != null) {
              CashHelper.saveData(
                      key: 'token', value: state.loginModel.accessToken)
                  .then((value) {
                token = state.loginModel.accessToken;
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeLayout(),
                  ),
                );
                emailController.clear();
               passwordController.clear();
              });
            }

            else
            {
            emailController.clear();
             passwordController.clear();
              Fluttertoast.showToast(
                msg: 'We were unable to login, Please! check the entered data',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.sp,
              );
            }
          }

          else if (state is LoginErrorState) {
            Fluttertoast.showToast(
              msg: 'The e-mail or phone number already used',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.sp,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 8.h,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44.sp,
                          color: KdefaultColor[800],
                        ),
                      ),

                      SizedBox(
                        height: 14.h,
                      ),

                      const Image(image: AssetImage('assets/images/login.jpg')),

                      SizedBox(
                        height: 70.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: CustomTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          label: 'E-mail',
                          prefix: const Icon(Icons.mail_outline),
                          validationMode: AutovalidateMode.onUserInteraction,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'e-mail must not be empty';
                            } else if ((RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) ==
                                false) {
                              return 'Please! enter valid e-mail. EX: john@gmail.com';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                        ),
                        child: CustomTextFormField(
                          controller:
                              passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          label: 'Password',
                          isPassword: LoginCubit.get(context).isPasswordHidden,
                          prefix: const Icon(Icons.lock),
                          suffix: LoginCubit.get(context).passwordIcon,
                          validationMode: AutovalidateMode.onUserInteraction,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 letters';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Checkbox(
                              value:  LoginCubit.get(context).isChecked,
                              onChanged: (val)
                              {
                                LoginCubit.get(context).changeChecked();
                              }
                          ),
                          Text(
                            'Remember me ?',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          TextButton(
                            onPressed: () {
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => Register(),
                              //   ),
                              // );
                            },
                            child: Text(
                              'ForgotPassword',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.8,
                              ),
                            ),
                          ),
                        ],
                      ),



                      state is! LoginLoadingState
                          ? SizedBox(
                        width: double.infinity,
                            child: CustomElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    LoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                color: KdefaultColor,
                                height: 58.h,
                                borderRadius: 15.r,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    color: Colors.white,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ),
                          )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
