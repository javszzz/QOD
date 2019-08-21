import 'dart:async';

import 'package:meta/meta.dart';
import 'package:qod/models/qoute.dart';
import 'package:qod/repositories/qoute_api_client.dart';


class QouteRepository {
  final QouteAPIClient qouteAPIClient;

  QouteRepository({@required this.qouteAPIClient})
      : assert(qouteAPIClient != null);

  Future<Qoute> getQouteOfTheDay() async {
    return await qouteAPIClient.getQouteOfTheDay();
  }

}
