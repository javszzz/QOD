import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:qod/blocs/blocs.dart';
import 'package:qod/blocs/qoute_state.dart';
import 'package:qod/models/models.dart';
import 'package:qod/repositories/repositories.dart';

class QouteBloc extends Bloc<QouteEvent, QouteState> {

  final QouteRepository qouteRepository;

  QouteBloc({@required this.qouteRepository})
      : assert(qouteRepository != null);

  @override
  QouteState get initialState => QouteEmpty();

  @override
  Stream<QouteState> mapEventToState(QouteEvent event) async* {
    if (event is FetchQoute) {
      yield QouteLoading();
      try {
        final Qoute qoute = await qouteRepository.getQouteOfTheDay();
        yield QouteLoaded(qoute: qoute);
      } catch (error) {
        print(error);
        yield QouteError();
      }
    }
  }
}