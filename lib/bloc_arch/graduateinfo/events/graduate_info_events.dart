import 'package:equatable/equatable.dart';

abstract class GraduateInfoEvents extends Equatable {
  const GraduateInfoEvents();
}

class GraduateInfoRequested extends GraduateInfoEvents {
  final int id;

  const GraduateInfoRequested(this.id)
      : assert(id != null);

  @override
  List<Object> get props => [id];
}
