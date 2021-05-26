import 'package:equatable/equatable.dart';
import 'package:graduate_stu/data/model/graduate_info.dart';

abstract class GraduateInfoState extends Equatable {
  const GraduateInfoState();

  @override
  List<Object> get props => [];
}

class GraduateInfoInitial extends GraduateInfoState {}

class GraduateInfoLoadIn extends GraduateInfoState {}

class GraduateInfoLoadSuccess extends GraduateInfoState {
  final GraduateInfo graduate;

  const GraduateInfoLoadSuccess(this.graduate)
      : assert(graduate != null);

  @override
  List<Object> get props => [graduate];
}

class GraduateInfoLoadFailure extends GraduateInfoState {}
