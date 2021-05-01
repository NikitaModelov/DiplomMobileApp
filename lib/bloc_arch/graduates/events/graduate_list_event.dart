import 'package:equatable/equatable.dart';

abstract class GraduateListEvent extends Equatable {
  const GraduateListEvent();
}

class GraduateListRequested extends GraduateListEvent {
  final String year;
  final String faculty;

  const GraduateListRequested({this.year, this.faculty})
      : assert(year != null, faculty != null);

  @override
  List<Object> get props => [year, faculty];
}

