import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeDataUpdated extends HomeState {
  final bool isValue;

  HomeDataUpdated({required this.isValue});
}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

