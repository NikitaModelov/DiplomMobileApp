import 'package:flutter_application/bloc_arch/signin/data/repository/sign_in_repository.dart';
import 'package:flutter_application/bloc_arch/splash/events/splash_events.dart';
import 'package:flutter_application/bloc_arch/splash/states/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashComponent extends Bloc<SplashEvents, SplashState> {

  SplashComponent() : super(null) {
    add(SplashRequested());
  }

  @override
  Stream<SplashState> mapEventToState(SplashEvents event) async* {
    if (event is SplashRequested) {
      yield SplashInitial();
      try {
        var statusCode = await SignInRepository.volidateToken();
        if (statusCode == 202) {
          yield SplashSuccess();
        } else {
          yield SplashFailure();
        }
      } catch (_) {
        yield SplashFailure();
      }
    }
  }

}