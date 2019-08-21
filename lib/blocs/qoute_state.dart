import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:qod/models/models.dart';

abstract class QouteState extends Equatable {
  QouteState([List props = const []]) : super(props);
}

class QouteEmpty extends QouteState {}

class QouteLoading extends QouteState {}

class QouteLoaded extends QouteState {

  final Qoute qoute;

  QouteLoaded({@required this.qoute}): assert(qoute != null), super([qoute]);

}

class QouteError extends QouteState {

}