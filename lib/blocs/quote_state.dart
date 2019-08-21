import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:qod/models/models.dart';

abstract class QuoteState extends Equatable {
  QuoteState([List props = const []]) : super(props);
}

class QuoteEmptyState extends QuoteState {}

class QuoteLoadingState extends QuoteState {}

class QuoteLoadedState extends QuoteState {

  final Quote quote;
  QuoteLoadedState({@required this.quote}): assert(quote != null), super([quote]);
}

class QuoteErrorState extends QuoteState {

}