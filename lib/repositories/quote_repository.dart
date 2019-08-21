import 'dart:async';

import 'package:meta/meta.dart';
import 'package:qod/repositories/repositories.dart';
import 'package:qod/models/models.dart';

class QouteRepository {
  final QouteAPIClient qouteAPIClient;

  QouteRepository({@required this.qouteAPIClient})
      : assert(qouteAPIClient != null);

  Future<Quote> getQouteOfTheDay() async {
    return await qouteAPIClient.getQouteOfTheDay();
  }

}
