import 'package:flutter/cupertino.dart';
import 'package:flutter_application/bloc_arch/graduates/data/repository/graduate_list_repository.dart';
import 'package:flutter_application/bloc_arch/graduates/events/graduate_list_event.dart';
import 'package:flutter_application/bloc_arch/graduates/states/graduate_list_states.dart';
import 'package:flutter_application/data/model/graduate_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraduateListComponent extends Bloc<GraduateListEvent, GraduateListState> {
  final String year;

  GraduateListComponent(this.year) : super(null) {
    add(GraduateListRequested(year: year));
  }

  @override
  Stream<GraduateListState> mapEventToState(GraduateListEvent event) async* {
    if (event is GraduateListRequested) {
      yield GraduateListLoadInProgress();
      try {
        final List<GraduateCard> graduates =
            await GraduateListRepository.getGraduates(year);
        yield GraduateListLoadSuccess(graduates: graduates);
      } catch (e) {
        debugPrint("ERROR COMPONENT $e");
        yield GraduateListLoadFailure();
      }
    }
  }
}
