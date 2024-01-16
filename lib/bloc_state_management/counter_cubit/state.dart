// countries_state.dart




import 'package:e_comerce/models/country_model.dart';

abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<CountryModel> countries;

   CountriesLoaded(this.countries);

  @override
  List<Object> get props => [countries];
}

class CountriesError extends CountriesState {
  final String error;

   CountriesError(this.error);

  @override
  List<Object> get props => [error];
}
