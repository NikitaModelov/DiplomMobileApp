import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_stu/bloc_arch/common/error_screen.dart';
import 'package:graduate_stu/bloc_arch/filter/filter_screen.dart';
import 'package:graduate_stu/bloc_arch/graduateinfo/widget/graduate_info_screen.dart';
import 'package:graduate_stu/bloc_arch/graduates/component/graduate_list_component.dart';
import 'package:graduate_stu/bloc_arch/graduates/events/graduate_list_event.dart';
import 'package:graduate_stu/bloc_arch/graduates/states/graduate_list_states.dart';
import 'package:graduate_stu/data/model/graduate_card.dart';
import 'package:grouped_list/grouped_list.dart';

class GraduateListScreenArg {
  final String id;

  GraduateListScreenArg(this.id);
}

class GraduateListScreen extends StatefulWidget {
  static const String routeName = "/graduates_page";

  @override
  State<StatefulWidget> createState() {
    return _GraduateListScreenState();
  }
}

class _GraduateListScreenState extends State<GraduateListScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  DateTime _dateFromFilter = DateTime.now();
  String _group = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GraduateListComponent(_dateFromFilter.year.toString(), _group),
      child: BlocBuilder<GraduateListComponent, GraduateListState>(
        builder: (context, state) {
          if (state is GraduateListLoadSuccess) {
            debugPrint("SUCCESS STATE");
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: const Text(
                  "Выпускники",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.black),
                    onPressed: () async {
                      Map results = await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                        return new FilterScreen();
                      }));

                      if (results != null && results.containsKey('year')) {
                        setState(() {
                          _dateFromFilter = results['year'];
                          _group = results['group'] == "Все" ? "" : results['group'];
                          BlocProvider.of<GraduateListComponent>(context)
                              .add(GraduateListRequested(year: _dateFromFilter.year.toString(), group: _group));
                          print(_dateFromFilter);
                        });
                      }
                    },
                  ),
                ],
              ),
              body: RefreshIndicator(
                color: Colors.blue,
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  BlocProvider.of<GraduateListComponent>(context)
                      .add(GraduateListRequested(year: _dateFromFilter.year.toString(), group: _group));
                },
                child: _buildList(state.graduates),
              ),
            );
          } else if (state is GraduateListLoadInProgress) {
            debugPrint("PROGRESS STATE");
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: const Text(
                  "Выпускники",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.black),
                    onPressed: () async {
                      Map results = await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                        return new FilterScreen();
                      }));

                      if (results != null && results.containsKey('year')) {
                        setState(() {
                          _dateFromFilter = results['year'];
                          _group = results['group'] == "Все" ? "" : results['group'];
                          BlocProvider.of<GraduateListComponent>(context)
                              .add(GraduateListRequested(year: _dateFromFilter.year.toString(), group: _group));
                          print(_dateFromFilter);
                        });
                      }
                    },
                  ),
                ],
              ),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            debugPrint("ERROR STATE");
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: const Text(
                  "Выпускники",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    color: Colors.black,
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_list, color: Colors.black),
                    onPressed: () async {
                      Map results = await Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
                        return new FilterScreen();
                      }));

                      if (results != null && results.containsKey('year')) {
                        setState(() {
                          _dateFromFilter = results['year'];
                          _group = results['group'] == "Все" ? "" : results['group'];
                          BlocProvider.of<GraduateListComponent>(context)
                              .add(GraduateListRequested(year: _dateFromFilter.year.toString(), group: _group));
                          print(_dateFromFilter);
                        });
                      }
                    },
                  ),
                ],
              ),
              body: RefreshIndicator(
                  color: Colors.blue,
                  key: _refreshIndicatorKey,
                  onRefresh: () async {
                    BlocProvider.of<GraduateListComponent>(context)
                        .add(GraduateListRequested(year: _dateFromFilter.year.toString(), group: _group));
                  },
                  child: ErrorScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildList(List<GraduateCard> list) {
    return GroupedListView<GraduateCard, String>(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 80),
      elements: list,
      groupBy: (element) => element.scope.group,
      groupComparator: (value1, value2) => value2.compareTo(value1),
      order: GroupedListOrder.DESC,
      useStickyGroupSeparators: true,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          value,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      indexedItemBuilder: (context, element, index) {
        return Container(
          margin: new EdgeInsets.only(top: 7.5),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                GraduateInfoScreen.routeName,
                arguments: GraduateListScreenArg(element.id),
              );
            },
            leading: Container(
              height: 60,
              width: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(element.urlImage),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.transparent, // set border color
                  width: 0,
                ), // set border width
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
            ),
            title: Text(
                "${element.secondName} ${element.firstName} ${element.patronymic}"),
          ),
        );
      },
    );
  }
}
