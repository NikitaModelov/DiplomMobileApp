import 'package:flutter_application/bloc_arch/graduates/data/repository/graduate_list_repository.dart';
import 'package:flutter_application/bloc_arch/graduates/events/graduate_list_event.dart';
import 'package:flutter_application/bloc_arch/graduates/states/graduate_list_states.dart';
import 'package:flutter_application/data/model/graduate_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraduateListComponent extends Bloc<GraduateListEvent, GraduateListState> {
  final String year;
  final String faculty;

  GraduateListComponent(this.year, this.faculty) : super(null) {
    add(GraduateListRequested(year: year, faculty: faculty));
  }

  @override
  Stream<GraduateListState> mapEventToState(GraduateListEvent event) async* {
    if (event is GraduateListRequested) {
      yield GraduateListLoadInProgress();
      try {
        final List<GraduateCard> graduates =
            await GraduateListRepository.getGraduates(year, faculty);
        yield GraduateListLoadSuccess(graduates: graduates);
      } catch (_) {
        yield GraduateListLoadFailure();
      }
    }
  }
}
