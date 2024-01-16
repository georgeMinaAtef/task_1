// countries_view.dart

import 'package:e_comerce/bloc_state_management/app_cubit/app_cubit.dart';
import 'package:e_comerce/shared/components/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../bloc_state_management/app_cubit/app_states.dart';
import '../../shared/constants.dart';

// ... existing imports

class CountriesView extends StatefulWidget {
  const CountriesView({super.key});

  @override
  State<CountriesView> createState() => _CountriesViewState();
}

class _CountriesViewState extends State<CountriesView> {

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getCountriesData(AppCubit.get(context).selectedCountryIndex);
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        if (state is CountriesLoading ) {
          return  SpinKitFadingCube(
            color: KdefaultColor,
            size: 50.w,
          );
        }

        else if (state is CountriesLoaded ) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40, left: 20, right: 20, top: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: ()
                        {

                        },
                        child: const Text('Country'),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: CustomElevatedButton(
                        onPressed: ()
                        {

                        },
                        child: const Text('Capital'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 7,
                child: ListView.builder(
                  itemCount: state.countries.length,
                  itemBuilder: (context, index) {
                    var country = state.countries[AppCubit.get(context).selectedCountryIndex];
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: Text('${country.name}')),
                              const SizedBox(width: 100),
                              Expanded(child: Text('${country.capital}')),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.countries.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: 80,
                        height: 40,
                        child: CustomElevatedButton(
                          color:  AppCubit.get(context).selectedCountryIndex == index ? Colors.blue : Colors.grey,
                          onPressed: () {
                            AppCubit.get(context).selectedCountryIndex = index;
                            AppCubit.get(context).getCountriesData(index);
                          },
                          child: Text('${index + 1}'),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is CountriesError) {
          return Text('Error: ${state.error}');
        } else {
          return const Text('No data');
        }
      },
    );
  }
}
