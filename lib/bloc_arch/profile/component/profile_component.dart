import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_stu/bloc_arch/profile/data/repository/profile_repository.dart';
import 'package:graduate_stu/bloc_arch/profile/events/profile_events.dart';
import 'package:graduate_stu/bloc_arch/profile/states/profile_states.dart';

class ProfileComponent extends Bloc<ProfileEvent, ProfileState> {
  ProfileComponent() : super(null) {
    add(ProfileRequestedEvent());
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileRequestedEvent) {
      yield ProfileLoadingState();
      try {
        final profile = await ProfileRepository.getProfile();
        if (profile != null) {
          yield ProfileSuccessState(profile);
        } else {
          yield ProfileErrorState();
        }
      } catch (e) {
        debugPrint("ProfileComponent error: $e");
        yield ProfileErrorState();
      }
    }
  }
}
