import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  String quote;
  String author;

  Quote(this.quote, this.author) : super([quote, author]);

  static Quote fromJson(dynamic json) {
      final contentsJson = json['contents'];
      final qouteJson = contentsJson['quotes'][0];
     
      String qoute = qouteJson['quote'];
      String author = qouteJson['author'];

      return Quote(qoute, author);
  }
}