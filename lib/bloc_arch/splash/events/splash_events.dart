import 'package:equatable/equatable.dart';

abstract class SplashEvents extends Equatable {
  const SplashEvents();
}

class SplashRequested extends SplashEvents {
  @override

  List<Object> get props => [];
}

class SplashNavigateToHome extends SplashEvents {
  @override
  List<Object> get props => [];
}

class SplashNavigateToLogin extends SplashEvents {
  @override
  List<Object> get props => [];
}