import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc_state_management/app_cubit/app_cubit.dart';
import '../bloc_state_management/app_cubit/app_states.dart';
import '../shared/constants.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: ConvexAppBar(
              height: 60.h,
              backgroundColor: KdefaultColor,
              elevation: 4,
              activeColor: KdefaultColor,
              items: AppCubit.get(context).bottomNavBarItems,
              initialActiveIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeNavBar(index);
              },
            ),
            body: AppCubit.get(context)
                .screens[AppCubit.get(context).currentIndex],
          );
        });
  }
}
