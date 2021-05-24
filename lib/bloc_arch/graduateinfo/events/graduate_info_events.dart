import 'package:equatable/equatable.dart';

abstract class GraduateInfoEvents extends Equatable {
  const GraduateInfoEvents();
}

class GraduateInfoRequested extends GraduateInfoEvents {
  final String id;

  const GraduateInfoRequested(this.id)
      : assert(id != null);

  @override
  List<Object> get props => [id];
}
