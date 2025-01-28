import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeState {}

@immutable
sealed class HomeEvent extends Equatable {}

class HomeDataUpdated extends HomeState {
  final bool isValue;
  final bool isUpdate;

  HomeDataUpdated({required this.isValue, required this.isUpdate});
}
