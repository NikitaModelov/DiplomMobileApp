import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduate_stu/data/model/graduate_card.dart';

abstract class GraduateListState extends Equatable {
  const GraduateListState();

  @override
  List<Object> get props => [];
}

class GraduateListInitial extends GraduateListState {}

class GraduateListLoadInProgress extends GraduateListState {}

class GraduateListLoadSuccess extends GraduateListState {
  final List<GraduateCard> graduates;

  const GraduateListLoadSuccess({@required this.graduates})
      : assert(graduates != null);

  @override
  List<Object> get props => [graduates];
}

class GraduateListLoadFailure extends GraduateListState {}
