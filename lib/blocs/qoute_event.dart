import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class QouteEvent extends Equatable {
  QouteEvent([List props = const []]) : super(props);
}

class FetchQoute extends QouteEvent {}