import 'package:flutter_application/bloc_arch/profile/data/model/profile_model.dart';
import 'package:flutter_application/bloc_arch/profile/data/repository/profile_repository.dart';
import 'package:flutter_application/bloc_arch/profile/events/profile_events.dart';
import 'package:flutter_application/bloc_arch/profile/states/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileComponent extends Bloc<ProfileEvent, ProfileState> {
  ProfileComponent() : super(null) {
    add(ProfileRequested());
  }

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileRequested) {
      yield ProfileLoading();
      try {
        final Profile profile = await ProfileRepository.getProfile();
        if (profile != null) {
          yield ProfileSuccess(profile: profile);
        }
      } catch (_) {
        yield ProfileFailure();
      }
    }
  }
}
