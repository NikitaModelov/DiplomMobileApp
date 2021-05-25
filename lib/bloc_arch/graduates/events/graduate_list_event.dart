import 'package:equatable/equatable.dart';

abstract class GraduateListEvent extends Equatable {
  const GraduateListEvent();
}

class GraduateListRequested extends GraduateListEvent {
  final String year;

  const GraduateListRequested({this.year})
      : assert(year != null);

  @override
  List<Object> get props => [year];
}

