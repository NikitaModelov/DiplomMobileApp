import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application/bloc_arch/profile/data/model/profile_model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final Profile profile;

  const ProfileSuccess({@required this.profile}) : assert(profile != null);

  @override
  List<Object> get props => [profile];
}

class ProfileFailure extends ProfileState {}
