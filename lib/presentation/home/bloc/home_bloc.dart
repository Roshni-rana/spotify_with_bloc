import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify_app/presentation/home/bloc/home_event.dart';
import 'package:spotify_app/presentation/home/bloc/home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeInitial> {
  bool isValue = false;

  HomeBloc({required this.isValue}) : super(HomeInitial()) {
    on<HomeDataUpdated>(_updateValue);
  }

  FutureOr<void> _updateValue(HomeDataUpdated event, Emitter<HomeInitial> emit) async {
    isValue = !isValue;
    emit(HomeDataUpdated(isValue: isValue));
  }
}

