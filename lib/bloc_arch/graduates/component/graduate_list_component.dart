import 'package:flutter/cupertino.dart';
import 'package:graduate_stu/bloc_arch/graduates/data/repository/graduate_list_repository.dart';
import 'package:graduate_stu/bloc_arch/graduates/events/graduate_list_event.dart';
import 'package:graduate_stu/bloc_arch/graduates/states/graduate_list_states.dart';
import 'package:graduate_stu/data/model/graduate_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraduateListComponent extends Bloc<GraduateListEvent, GraduateListState> {
  final String year;
  final String group;

  GraduateListComponent(this.year, this.group) : super(null) {
    add(GraduateListRequested(year: year, group: group));
  }

  @override
  Stream<GraduateListState> mapEventToState(GraduateListEvent event) async* {
    if (event is GraduateListRequested) {
      yield GraduateListLoadInProgress();
      try {
        final List<GraduateCard> graduates =
            await GraduateListRepository.getGraduates(event.year, event.group);
        yield GraduateListLoadSuccess(graduates: graduates);
      } catch (e) {
        debugPrint("ERROR COMPONENT $e");
        yield GraduateListLoadFailure();
      }
    }
  }
}
