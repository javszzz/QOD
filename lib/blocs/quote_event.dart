import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class QuoteEvent extends Equatable {
  QuoteEvent([List props = const []]) : super(props);
}

class FetchQuote extends QuoteEvent {}