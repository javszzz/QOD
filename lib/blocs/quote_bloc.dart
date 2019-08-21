import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:qod/blocs/blocs.dart';
import 'package:qod/models/models.dart';
import 'package:qod/repositories/repositories.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {

  final QouteRepository qouteRepository;

  QuoteBloc({@required this.qouteRepository})
      : assert(qouteRepository != null);

  @override
  QuoteState get initialState => QuoteEmptyState();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is FetchQuote) {
      yield QuoteLoadingState();
      try {
        final Quote qoute = await qouteRepository.getQouteOfTheDay();
        yield QuoteLoadedState(quote: qoute);
      } catch (error) {
        print(error);
        yield QuoteErrorState();
      }
    }
  }
}