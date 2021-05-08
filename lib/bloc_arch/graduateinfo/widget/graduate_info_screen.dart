import 'package:flutter/material.dart';
import 'package:flutter_application/bloc_arch/common/error_screen.dart';
import 'package:flutter_application/bloc_arch/graduateinfo/component/graduate_info_component.dart';
import 'package:flutter_application/bloc_arch/graduateinfo/events/graduate_info_events.dart';
import 'package:flutter_application/bloc_arch/graduateinfo/state/graduate_info_state.dart';
import 'package:flutter_application/bloc_arch/graduates/widget/graduate_list_screen.dart';
import 'package:flutter_application/data/model/graduate_info.dart';
import 'package:flutter_application/screens/link_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GraduateInfoScreen extends StatefulWidget {
  static const routeName = "/graduate_info";

  @override
  State<StatefulWidget> createState() => _GraduateInfoScreenState();
}

class _GraduateInfoScreenState extends State<GraduateInfoScreen> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  double _visible = 0.0;

  @override
  Widget build(BuildContext context) {
    final GraduateListScreenArg arg = ModalRoute.of(context).settings.arguments;

    return BlocProvider(
      create: (context) => GraduateInfoComponent(arg.id),
      child: BlocBuilder<GraduateInfoComponent, GraduateInfoState>(
        builder: (context, state) {
          if (state is GraduateInfoLoadSuccess) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
              ),
              body: _buildBody(context, state.graduate),
            );
          } else if (state is GraduateInfoLoadIn) {
            return Scaffold(
              //appBar: _buildAppBar(),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              body: RefreshIndicator(
                  color: Colors.blue,
                  key: _refreshIndicatorKey,
                  onRefresh: () async {
                    BlocProvider.of<GraduateInfoComponent>(context).add(
                      GraduateInfoRequested(arg.id),
                    );
                  },
                  child: ErrorScreen()),
            );
          }
        },
      ),
    );
  }

  Stack _buildBody(BuildContext context, GraduateInfo graduate) {
    return Stack(
      children: [
        SlidingUpPanel(
          minHeight: 180,
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          collapsed: _buildCollapsedBlock(graduate),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(graduate.urlImage),
              ),
            ),
          ),
          onPanelSlide: (position) {
            setState(() {
              _visible = position;
            });
          },
          panelBuilder: (ScrollController sc) => _scrollingList(sc, graduate),
        ),
        Positioned(
          bottom: 0,
          child: _buildButton(context, graduate),
        ),
      ],
    );
  }

  Widget _scrollingList(ScrollController sc, GraduateInfo graduate) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 100),
      opacity: _visible,
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 16, end: 16, top: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsetsDirectional.only(bottom: 90, top: 0),
          controller: sc,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextBlockColumn("ФИО",
                  "${graduate.patronymic} ${graduate.firstName} ${graduate.patronymic}"),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Дата рождения", graduate.birthDay),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Факультет", graduate.faculty),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Специальность", graduate.speciality),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Группа", graduate.group),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Год выпуска", graduate.yearGraduate),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Достижения",
                  graduate.achievement != null ? graduate.achievement : " "),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Местоположение", graduate.locate),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Место работы", graduate.placeWork),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildTextBlockColumn(String label, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(
          height: 8,
        ),
        Text(
          description,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Container _buildButton(BuildContext context, GraduateInfo graduate) {
    return Container(
      color: Colors.white,
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RaisedButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => LinkDialog(
                firstName: graduate.firstName,
              ),
            );
          },
          padding: EdgeInsets.all(10.0),
          color: Color(0xff0881D1),
          textColor: Colors.white,
          child: Text("Связаться"),
        ),
      ),
    );
  }

  Container _buildCollapsedBlock(GraduateInfo graduate) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${graduate.firstName} ${graduate.secondName}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Возраст",
                  ),
                  Text(
                    "21 год",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Местоположение",
                  ),
                  Text(
                    graduate.locate,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Факультет",
                  ),
                  Text(
                    graduate.faculty,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
