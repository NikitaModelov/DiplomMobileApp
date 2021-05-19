import 'package:flutter_application/bloc_arch/signin/data/repository/sign_in_repository.dart';
import 'package:flutter_application/bloc_arch/signin/event/sign_in_events.dart';
import 'package:flutter_application/bloc_arch/signin/state/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingInComponent extends Bloc<SignInEvents, SignInState> {
  SingInComponent() : super(null) {
    add(SignInInited());
  }

  @override
  Stream<SignInState> mapEventToState(SignInEvents event) async* {
    if (event is SignInInited) {
      yield SignInInitial();
    } else if (event is SignInRequested) {
      yield SignInLoading();
      try {
        final int responseCode = await SignInRepository.signIn(event.loginInfo);
        if (responseCode == 200) {
          yield SignInSuccess();
        } else {
          yield SignInFailure();
        }
      } catch (_) {
        yield SignInFailure();
      }
    }
  }
}
