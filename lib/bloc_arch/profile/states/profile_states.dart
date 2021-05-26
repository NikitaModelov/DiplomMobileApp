import 'package:equatable/equatable.dart';
import 'package:graduate_stu/bloc_arch/profile/data/model/profile_model.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final Profile profile;

  const ProfileSuccessState(this.profile) : assert(profile != null);

  @override
  List<Object> get props => [profile];
}

class ProfileErrorState extends ProfileState {}
