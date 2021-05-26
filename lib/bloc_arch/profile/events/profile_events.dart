import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileRequestedEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}