// countries_cubit.dart



import 'package:e_comerce/bloc_state_management/counter_cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

}
