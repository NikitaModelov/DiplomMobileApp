import 'package:flutter/cupertino.dart';
import 'package:flutter_application/bloc_arch/graduateinfo/data/repository/graduate_info_repository.dart';
import 'package:flutter_application/bloc_arch/graduateinfo/events/graduate_info_events.dart';
import 'package:flutter_application/bloc_arch/graduateinfo/state/graduate_info_state.dart';
import 'package:flutter_application/data/model/graduate_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraduateInfoComponent
    extends Bloc<GraduateInfoEvents, GraduateInfoState> {
  final String id;

  GraduateInfoComponent(this.id) : super(null) {
    add(GraduateInfoRequested(id));
  }

  @override
  Stream<GraduateInfoState> mapEventToState(GraduateInfoEvents event) async* {
    if (event is GraduateInfoRequested) {
      yield GraduateInfoLoadIn();
      try {
        final GraduateInfo graduate =
            await GraduateInfoRepository.getGraduateInfo(id);
        yield GraduateInfoLoadSuccess(graduate);
      } catch (e) {
        debugPrint("Error Component: $e");
        yield GraduateInfoLoadFailure();
      }
    }
  }
}
