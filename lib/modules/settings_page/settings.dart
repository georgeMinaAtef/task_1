
import 'package:e_comerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_comerce/bloc_state_management/app_cubit/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/components/custom_elevated_button.dart';
import '../../shared/components/custom_text_field.dart';
import '../../shared/constants.dart';



class SettingsPage extends StatelessWidget {
   SettingsPage({super.key});
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getUserData();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:    Text(
              'Who Am I',
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
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Center(
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(AppCubit.get(context).userData?.data!.avatar ??"" ),
                      ),
                    ),


                     SizedBox(height: 40.h,),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: AppCubit.get(context).firstNameController,
                            keyboardType: TextInputType.name,
                            enable: false,
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
                            controller: AppCubit.get(context).lastNameController,
                            keyboardType: TextInputType.name,
                            label: 'Last Name',
                            enable: false,
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
                      controller: AppCubit.get(context).emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: 'Email',
                      enable: false,
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
                      controller:AppCubit.get(context).passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      label: 'password',
                      enable: false,
                      isPassword:
                      AppCubit.get(context).isPasswordHidden,
                      prefix: const Icon(Icons.lock),
                      suffix: AppCubit.get(context).passwordIcon,
                      validationMode: AutovalidateMode.onUserInteraction,
                      suffixPressed: () {
                        AppCubit.get(context)
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


                    //

                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Buyer', style: TextStyle(fontSize: 8),),
                            fillColor:  AppCubit.get(context).userData?.data?.type?.code == 1 ?  const MaterialStatePropertyAll(Colors.blue) : const MaterialStatePropertyAll(Colors.black),
                            value: 'buyer',
                            groupValue: '${AppCubit.get(context).userData?.data?.gender}',
                            onChanged: (value) {

                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Seller', style: TextStyle(fontSize: 8),),
                            fillColor:  AppCubit.get(context).userData?.data?.type?.code == 2 ?  const MaterialStatePropertyAll(Colors.blue) : const MaterialStatePropertyAll(Colors.black),
                            value: 'seller',
                            groupValue: '${AppCubit.get(context).userData?.data?.gender}',
                            onChanged: (value) {

                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Bath', style: TextStyle(fontSize: 8),),
                            fillColor:  AppCubit.get(context).userData?.data?.type?.code == 3 ?  const MaterialStatePropertyAll(Colors.blue) : const MaterialStatePropertyAll(Colors.black),
                            value: 'bath',
                            groupValue: '${AppCubit.get(context).userData?.data?.gender}',
                            onChanged: (value) {

                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 15.h,
                    ),


                    CustomTextFormField(
                      controller: AppCubit.get(context).aboutController,
                      keyboardType: TextInputType.text,
                      enable: false,
                      label: 'about',
                      // maxLine: 3,
                      validationMode: AutovalidateMode.onUserInteraction,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'About must not be empty';
                        } else {
                          return null;
                        }
                      },
                    ),


                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26, // Example border color
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,left: 20),
                        child: Text(' Salary       SAR ${AppCubit.get(context).userData?.data?.salary} \$'),
                      ),
                    ),


                    SizedBox(
                      height: 30.h,
                    ),

                    CustomTextFormField(
                        controller: AppCubit.get(context).dateController,
                        keyboardType: TextInputType.datetime ,
                        label: 'Birth Day',
                        enable: false,
                        prefix:const Icon( Icons.calendar_today),
                        validate: (String? value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'Date must be equal null';
                          }
                          return null;
                        },

                    ),

                    SizedBox(
                      height: 8.h,
                    ),

                    Text('Gender',  style: TextStyle(
                      color: KdefaultColor[800],
                    ),),

                    SizedBox(
                      height: 8.h,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Male'),
                            fillColor:  AppCubit.get(context).userData?.data?.gender == 1 ?  const MaterialStatePropertyAll(Colors.blue) : const MaterialStatePropertyAll(Colors.black),
                            value: 'Male',
                            groupValue: '${AppCubit.get(context).userData?.data?.gender}',
                            onChanged: (value) {

                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                            title: const Text('Female'),
                            fillColor:  AppCubit.get(context).userData?.data?.gender == 2 ?  const MaterialStatePropertyAll(Colors.blue) : const MaterialStatePropertyAll(Colors.black),
                            value: 'Female',
                            groupValue: '${AppCubit.get(context).userData?.data?.gender}',
                            onChanged: (value) {

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
                      itemCount: AppCubit.get(context).socialMediaPlatforms.length,
                      itemBuilder: (context, index) {
                        bool ch = false;
                            (AppCubit.get(context).userData?.data?.favoriteSocialMedia?.length)!-1  == index ? ch = true : false;
                        return Row(
                          children: [
                              Checkbox(
                                value:  ch ,
                                onChanged: (value)
                                {

                                },
                              ),


                            SizedBox(
                                width:40,
                                height:20,
                                child: Image(
                                    image: AssetImage( AppCubit.get(context).socialMediaIcons[index])
                                )),

                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(AppCubit.get(context).socialMediaPlatforms[index]),
                            ),
                          ],
                        );
                      },
                    ),


                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          ),



        );
      },
    );
  }
}
