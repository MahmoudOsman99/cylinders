import '../../domain/entities/troubleshoot.dart';

class TroubleshootModel extends Troubleshoot {
  TroubleshootModel({
    required super.ID,
    required super.name,
    required super.descrition,
    required super.solve,
  });

  factory TroubleshootModel.fromJson(
      {required Map<String, dynamic> json, String? idFromFirebase}) {
    return TroubleshootModel(
      ID: idFromFirebase ?? json['ID'],
      name: json['name'],
      descrition: json['descrition'],
      solve: json['solve'],
    );
  }

  static Map<String, String> toJson(Troubleshoot troubleshoot) {
    return {
      'name': troubleshoot.name,
      'descrition': troubleshoot.descrition,
      'solve': troubleshoot.solve,
    };
  }
}
