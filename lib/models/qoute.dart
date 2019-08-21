import 'package:equatable/equatable.dart';

class Qoute extends Equatable {
  String quote;
  String author;

  Qoute(this.quote, this.author) : super([quote, author]);

  static Qoute fromJson(dynamic json) {
      final contentsJson = json['contents'];
      final qouteJson = contentsJson['quotes'][0];
     
      String qoute = qouteJson['quote'];
      String author = qouteJson['author'];

      return Qoute(qoute, author);
  }
}