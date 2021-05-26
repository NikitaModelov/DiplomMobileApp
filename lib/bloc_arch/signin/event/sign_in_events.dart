import 'package:equatable/equatable.dart';
import 'package:graduate_stu/bloc_arch/signin/data/api/sign_in_api_service.dart';

abstract class SignInEvents extends Equatable {
  const SignInEvents();
}

class SignInInited extends SignInEvents {
  @override
  List<Object> get props => [];
}

class SignInRequested extends SignInEvents {
  final LoginInfo loginInfo;

  const SignInRequested(this.loginInfo) : assert(loginInfo != null);

  @override
  List<Object> get props => [loginInfo];
}
