import 'package:equatable/equatable.dart';

abstract class GraduateListEvent extends Equatable {
  const GraduateListEvent();
}

class GraduateListRequested extends GraduateListEvent {
  final String year;
  final String group;

  const GraduateListRequested({this.year, this.group})
      : assert(year != null && group != null);

  @override
  List<Object> get props => [year];
}

