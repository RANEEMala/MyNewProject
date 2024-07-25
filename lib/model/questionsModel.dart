// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Questionsmodel {
  List questions;
  Questionsmodel({
    required this.questions,
  });

  Questionsmodel copyWith({
    List? questions,
  }) {
    return Questionsmodel(
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'questions': questions,
    };
  }

  factory Questionsmodel.fromMap(Map<String, dynamic> map) {
    return Questionsmodel(
      questions: List.from((map['questions'] as List)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Questionsmodel.fromJson(String source) => Questionsmodel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Questionsmodel(questions: $questions)';

  @override
  bool operator ==(covariant Questionsmodel other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.questions, questions);
  }

  @override
  int get hashCode => questions.hashCode;
}
