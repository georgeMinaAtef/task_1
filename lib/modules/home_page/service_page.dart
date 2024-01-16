import 'package:e_comerce/shared/components/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../bloc_state_management/app_cubit/app_cubit.dart';
import '../../bloc_state_management/app_cubit/app_states.dart';
import '../../shared/constants.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});


  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getHomeData();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AppGetHomeDataLoadingState ) {
          return  SpinKitFadingCube(
            color: KdefaultColor,
            size: 50.w,
          );
        } else if (state is AppGetHomeDataSuccessState  ) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                    'Service',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                    ),
                                    ),
                  ),
                SizedBox(
                  height: 8.h,
                ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                itemCount: state.homeModel.data?.length,
                  itemBuilder: (context, index) {
                    var service = state.homeModel.data?[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    child: state is AppGetHomeDataLoadingState? const Center(child: Placeholder(),) : Image(image: NetworkImage(service!.mainImage ??""), fit: BoxFit.cover,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      width: 80,
                                      child: CustomElevatedButton(
                                          color: Colors.orange.shade500,
                                          onPressed: (){},
                                          child: Text('\$ ${service?.price}')
                                      ),
                                    ),
                                  )
                                ],
                              ),


                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              service?.title ??'',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                const Icon(Icons.star,color: Colors.yellow,),
                                Text(
                                  ' { ${service?.averageRating} }  |' ,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),

                                const Icon(Icons.account_balance_wallet),

                                Text(
                                  '  ${service?.priceAfterDiscount} ' ,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

                  Text(
                    'Popular Service',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  SizedBox(
                    height: 8.h,
                  ),


                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.popularModel.data?.length,
                      itemBuilder: (context, index) {
                        var service = state.popularModel.data?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white,
                            child: SizedBox(
                              width: 200,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        child: state is AppGetHomeDataLoadingState? const Center(child: Placeholder(),) : Image(image: NetworkImage(service!.mainImage ??""), fit: BoxFit.cover,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SizedBox(
                                          width: 80,
                                          child: CustomElevatedButton(
                                              color: Colors.orange.shade500,
                                              onPressed: (){},
                                              child: Text('\$ ${service?.price}')
                                          ),
                                        ),
                                      )
                                    ],
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      service?.title ??'',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(Icons.star,color: Colors.yellow,),
                                      Text(
                                        ' { ${service?.averageRating} }  |' ,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),

                                      const Icon(Icons.account_balance_wallet),

                                      Text(
                                        '  ${service?.priceAfterDiscount} ' ,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
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
