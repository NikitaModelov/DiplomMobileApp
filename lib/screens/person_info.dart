import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/data/model/graduate_info.dart';
import 'package:flutter_application/data/repository/graduates_repository.dart';
import 'package:flutter_application/screens/link_dialog.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PersonInfo extends StatefulWidget {
  final GraduatesRepository _repository;
  PersonInfo(this._repository);

  
  
  @override
  _PersonInfoState createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo>
    with SingleTickerProviderStateMixin {
  double _visible = 0.0;
  bool _isLoading = true;
  GraduateInfo _graduate;

  @override
void initState() {
  super.initState();
  widget._repository.getGraduateInfo().then((value) => {
    setState(() {
      _graduate = value;
      _isLoading = false;
    })
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: _isLoading ? 1 : 0.1,
        backgroundColor: Colors.transparent,
      ),
      body: _isLoading ? _buildLoading() : _buildBody(context),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Stack _buildBody(BuildContext context) {
    return Stack(
      children: [
        SlidingUpPanel(
          minHeight: 180,
          backdropEnabled: true,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          collapsed: _buildCollapsedBlock(),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(_graduate.urlImage),
              ),
            ),
          ),
          onPanelSlide: (position) {
            setState(() {
              _visible = position;
            });
          },
          panelBuilder: (ScrollController sc) => _scrollingList(sc),
        ),
        Positioned(
          bottom: 0,
          child: _buildButton(context),
        ),
      ],
    );
  }

  Widget _scrollingList(ScrollController sc) {
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
              _buildTextBlockColumn("ФИО", "${_graduate.patronymic} ${_graduate.firstName} ${_graduate.patronymic}"),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Дата рождения", _graduate.birthDay),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Факультет", _graduate.faculty),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn(
                  "Специальность", _graduate.speciality),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Группа", _graduate.group),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Год выпуска", _graduate.yearGraduate),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn(
                  "Достижения", _graduate.achievement),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Местоположение", _graduate.locate),
              SizedBox(
                height: 20,
              ),
              _buildTextBlockColumn("Место работы", _graduate.placeWork),
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

  Container _buildButton(BuildContext context) {
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
                firstName: _graduate.firstName,
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

  Container _buildCollapsedBlock() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${_graduate.firstName} ${_graduate.secondName}",
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
                    _graduate.locate,
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
                    _graduate.faculty,
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
