
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../bloc_state_management/register_cubit/register_cubit.dart';
import '../../bloc_state_management/register_cubit/register_states.dart';
import '../../shared/components/custom_elevated_button.dart';
import '../../shared/components/custom_text_field.dart';
import '../../shared/constants.dart';
import '../log_in/login_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var formKey = GlobalKey<FormState>();

  var aboutController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var passwordControllerConfirm = TextEditingController();

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var dateController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.message != null) {
              Fluttertoast.showToast(
                msg: state.registerModel.message!   ,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.sp,
              );

              // Clear the text controllers here, after a successful registration
              emailController.clear();
              firstNameController.clear();
              lastNameController.clear();
              aboutController.clear();
              dateController.clear();
              passwordController.clear();

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            }
          }

          else if (state is RegisterErrorState) {
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
              title:    Text(
                'Register',
                style: TextStyle(
                  color: KdefaultColor[800],
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(
                color:
                KdefaultColor,
              ),
            ),
            body: Stepper(
              margin: EdgeInsets.zero,
              elevation: 0,
              type: StepperType.horizontal,
              steps: [
                Step(
                  state: StepState.complete,
                  isActive: RegisterCubit.get(context).currentStep >= 0,
                  title: const Text('Register'),
                  content:  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    controller: firstNameController,
                                    keyboardType: TextInputType.name,
                                    label: 'First Name',
                                    prefix: const Icon(Icons.person),
                                    validationMode: AutovalidateMode.onUserInteraction,
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Name must not be empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),

                                SizedBox(
                                  width: 8.h,
                                ),

                                Expanded(
                                  child: CustomTextFormField(
                                    controller: lastNameController,
                                    keyboardType: TextInputType.name,
                                    label: 'Last Name',
                                    prefix: const Icon(Icons.person),
                                    validationMode: AutovalidateMode.onUserInteraction,
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Name must not be empty';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              label: 'E-mail',
                              prefix: const Icon(Icons.mail_outline),
                              validationMode: AutovalidateMode.onUserInteraction,
                              validate: (String? value) {
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

                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextFormField(
                              controller:passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              label: 'Password',
                              isPassword:
                              RegisterCubit.get(context).isPasswordHidden,
                              prefix: const Icon(Icons.lock),
                              suffix: RegisterCubit.get(context).passwordIcon,
                              validationMode: AutovalidateMode.onUserInteraction,
                              suffixPressed: () {
                                RegisterCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'password must not be empty';
                                } else if (value.length < 6) {
                                  return 'Password is too short';
                                } else {
                                  return null;
                                }
                              },
                            ),

                            SizedBox(
                              height: 8.h,
                            ),
                            CustomTextFormField(
                              controller:passwordControllerConfirm,
                              keyboardType: TextInputType.visiblePassword,
                              label: 'Confirm Password',
                              isPassword:
                              RegisterCubit.get(context).isPasswordHidden2,
                              prefix: const Icon(Icons.lock),
                              suffix: RegisterCubit.get(context).passwordIcon2,
                              validationMode: AutovalidateMode.onUserInteraction,
                              suffixPressed: () {
                                RegisterCubit.get(context)
                                    .changePasswordVisibilityConfirm();
                              },
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'confirm password must not be empty';
                                } else if (value.length < 6) {
                                  return 'confirm password is too short';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              width: double.infinity,
                              height: 60,
                              padding: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton<int>(
                                value: context.read<RegisterCubit>().userType,
                                onChanged: (int? value) {
                                  if (value != null) {
                                    context.read<RegisterCubit>().updateUserType(value);
                                  }
                                },
                                underline: const Center(), // Remove the default underline
                                style: TextStyle(
                                color: KdefaultColor[800],
                              ),
                                icon: const Icon(Icons.arrow_drop_down), // Customize the dropdown icon
                                items: const [
                                  DropdownMenuItem(
                                    value: 1,
                                    child: Text('Seller'),
                                  ),
                                  DropdownMenuItem(
                                    value: 2,
                                    child: Text('Buyer'),
                                  ),
                                  DropdownMenuItem(
                                    value: 3,
                                    child: Text('Bath'),
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Step(
                  state: StepState.indexed,
                  isActive: RegisterCubit.get(context).currentStep >= 1,
                  title: const Text('Complete Data'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.green.shade400,
                            child: const Icon(Icons.add,size: 160,color: Colors.black,),
                          ),
                        ),
                    
                        const SizedBox(height: 20,),
                    
                    
                        CustomTextFormField(
                          controller: aboutController,
                          keyboardType: TextInputType.text,
                          maxLine: 3,
                          label: 'About',
                          validationMode: AutovalidateMode.onUserInteraction,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'About must not be empty';
                            } else {
                              return null;
                            }
                          },
                        ),
                    
                        SizedBox(
                          width: 8.h,
                        ),
                    
                        Text('Salary',  style: TextStyle(
                          color: KdefaultColor[800],
                        ),),
                    
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                    
                              GestureDetector(
                                onTap: ()
                                {
                                  RegisterCubit.get(context).decrementSalary(100);
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Text('-', style: TextStyle(
                                    color: KdefaultColor[800],
                                  ),),
                                ),
                              ),
                    
                              Text('SAR ${RegisterCubit.get(context).salary} \$'),
                    
                              GestureDetector(
                                onTap: ()
                                {
                                  RegisterCubit.get(context).incrementSalary(500);
                                },
                                child: CircleAvatar(
                                  radius: 30,
                                  child: Text('+', style: TextStyle(
                                    color: KdefaultColor[800],
                                  ),),
                                ),
                              ),
                    
                    
                    
                    
                            ],
                          ),
                        ),
                    
                        CustomTextFormField(
                            controller: dateController,
                            keyboardType: TextInputType.datetime ,
                            label: 'Enter Date',
                            prefix:const Icon( Icons.calendar_today),
                            validate: (String? value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'Date must be equal null';
                              }
                              return null;
                            },
                            onTab: ()
                            {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('1970-01-01'),
                                lastDate: DateTime.parse('2030-12-31'),
                              ).then((value)
                              {
                                dateController.text = DateFormat.yMMMd().format(value!);
                              });
                            }
                        ),
                    
                        Text('Gender',  style: TextStyle(
                          color: KdefaultColor[800],
                        ),),


                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('Male'),
                                value: 'Male',
                                groupValue: RegisterCubit.get(context).gender,
                                onChanged: (value) {
                                  RegisterCubit.get(context).updateGender('Male');
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                title: const Text('Female'),
                                value: 'Female',
                                groupValue: RegisterCubit.get(context).gender,
                                onChanged: (value) {
                                  RegisterCubit.get(context).updateGender('Female');
                                },
                              ),
                            ),
                          ],
                        ),


                        Text('Skills',  style: TextStyle(
                          color: KdefaultColor[800],
                        ),),
                    
                        SizedBox(
                          height: 10.h,
                        ),
                    
                    
                        Row(
                          children:
                          [
                          Expanded(
                            child: CustomElevatedButton(
                              color: Colors.blue.shade200,
                                onPressed: ()
                                {

                                },
                                child:  Text('Video Production x', style: TextStyle(
                                  color: KdefaultColor[800],
                                  fontSize: 12
                                ),)
                            ),
                          ),
                    
                          SizedBox(
                            width: 8.h,
                          ),
                    
                          Expanded(
                            child: CustomElevatedButton(
                                color: Colors.blue.shade200,
                                onPressed: ()
                                {

                                },
                                child:  Text('Video Production x', style: TextStyle(
                                    color: KdefaultColor[800],
                                    fontSize: 12
                                ),)
                            ),
                          ),
                    
                        ],),
                    
                        SizedBox(
                          height: 20.h,
                        ),
                    
                        Text('Favourite Social Media',  style: TextStyle(
                          color: KdefaultColor[800],
                        ),),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: RegisterCubit.get(context).socialMediaPlatforms.length,
                          itemBuilder: (context, index) {
                            final socialMedia = RegisterCubit.get(context).socialMediaPlatforms[index];
                            return Row(
                              children: [
                                Checkbox(
                                    value:  RegisterCubit.get(context).selectedSocialMedia.contains(socialMedia),
                                  onChanged: (value) {
                                    RegisterCubit.get(context).updateSocialMedia(socialMedia, value ?? false);
                                  },
                                ),

                                SizedBox(
                                  width:40,
                                    height:20,
                                    child: Image(
                                        image: AssetImage( RegisterCubit.get(context).socialMediaIcons[index])
                                    )),

                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(socialMedia),
                                ),
                              ],
                            );
                          },
                        ),


                        SizedBox(
                          height: 10.h,
                        ),


                      ]
                    ),
                  ),
                ),
              ],

              currentStep: RegisterCubit.get(context).currentStep,
              onStepContinue: () {
                context.read<RegisterCubit>().updateStep(RegisterCubit.get(context).currentStep + 1);
              },
              onStepCancel: () {
                context.read<RegisterCubit>().updateStep(RegisterCubit.get(context).currentStep - 1);
              },



              controlsBuilder: (context, ControlsDetails details) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (RegisterCubit.get(context).currentStep < 1) {
                          // Move to the next step
                          RegisterCubit.get(context).updateStep(RegisterCubit.get(context).currentStep + 1);
                        } else {
                          // Handle submission or any specific logic for the last step
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).registerUser(
                              salary: RegisterCubit.get(context).salary,
                              email: emailController.text,
                              password: passwordController.text,
                              about: aboutController.text,
                              gender: RegisterCubit.get(context).gender =='Male'?true:false,
                              first_name: firstNameController.text ,
                              last_name: lastNameController.text ,
                              birth_date: dateController.text,
                              favorite_social_media: RegisterCubit.get(context).selectedSocialMedia,
                              password_confirmation: passwordControllerConfirm.text,
                              tags: [155658262.27953],
                              avatar: File('@/var/www/kafiil-test/public/modules/user/images/user.png'),
                              type: 1,
                            );
                          }
                        }
                      },
                      color: KdefaultColor,
                      height: 58.h,
                      borderRadius: 15.r,
                      child: Text(
                        RegisterCubit.get(context).currentStep == 0 ? 'Next' : 'Submit',
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.white,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                );
              },


            ),



          );
        },
      ),
    );
  }
}
