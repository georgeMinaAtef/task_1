import 'package:e_comerce/models/service_model.dart';
import 'package:e_comerce/models/service_popular_model.dart';

import '../../models/country_model.dart';


abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeNavBarState extends AppStates {}

class AppGetHomeDataSuccessState extends AppStates {
  final ServiceModel homeModel;
  final ServicePopularModel popularModel;


  AppGetHomeDataSuccessState( {required this.popularModel,required this.homeModel});
}

class AppGetHomeDataLoadingState extends AppStates {}

class AppGetHomeDataErrorState extends AppStates {
  final String error;
  AppGetHomeDataErrorState(this.error);
}

class AppGetServicePopularSuccessState extends AppStates {
  final ServicePopularModel popularModel;

  AppGetServicePopularSuccessState({required this.popularModel});
}

class AppGetServicePopularLoadingState extends AppStates {}

class AppGetServicePopularErrorState extends AppStates {
  final String error;
  AppGetServicePopularErrorState(this.error);
}


class AppGetUserDataSuccessState extends AppStates {}

class AppGetUserDataErrorState extends AppStates {
  final String error;
  AppGetUserDataErrorState(this.error);
}

class AppUpdateUserDataSuccessState extends AppStates {}

class AppUpdateUserDataLoadingState extends AppStates {}

class AppUpdateUserDataErrorState extends AppStates {
  final String error;
  AppUpdateUserDataErrorState(this.error);
}

class CountriesLoading extends AppStates {}

class CountriesLoaded extends AppStates {
  final List<CountryData> countries;
  final int index;
  CountriesLoaded({required this.countries, required this.index});
}

class CountriesError extends AppStates {
  final String error;

  CountriesError(this.error);
}

class AppViewChangedState extends AppStates {}

// class AppCountryChangedState extends AppStates {
//    List<CountryData> countries;
//
//   AppCountryChangedState({required this.countries});
// }

class ChangePasswordVisibility extends AppStates {}