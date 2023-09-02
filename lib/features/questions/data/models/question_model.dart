import 'package:cylinders/features/questions/domain/entities/question.dart';

class QuestionModel extends Question {
  QuestionModel({
    required super.ID,
    required super.name,
    required super.descrition,
    required super.solve,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      ID: json['ID'],
      name: json['name'],
      descrition: json['descrition'],
      solve: json['solve'],
    );
  }

  static Map<String, String> toJson(Question question) {
    return {
      'name': question.name,
      'descrition': question.descrition,
      'solve': question.solve,
    };
  }
}
