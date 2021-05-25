import 'package:equatable/equatable.dart';
import 'package:flutter_application/bloc_arch/signin/data/api/sign_in_api_service.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileInited extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ProfileRequested extends ProfileEvent {
  const ProfileRequested() : assert(null);

  @override
  List<Object> get props => [];
}
