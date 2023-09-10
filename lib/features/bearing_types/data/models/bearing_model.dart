import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';

class BearingModel extends Bearing {
  BearingModel({
    super.ID,
    required super.name,
    required super.type,
    required super.usage,
    required super.startClearance,
    required super.endClearance,
    required super.isRadial,
    required super.numCat,
  });

  factory BearingModel.fromJson(Map<String, dynamic> json) {
    return BearingModel(
      name: json['name'],
      type: json['type'],
      usage: json['usage'],
      startClearance: json['startClearance'],
      endClearance: json['endClearance'],
      isRadial: json['isRadial'],
      numCat: json['numCat'],
    );
  }

  static Map<String, dynamic> toJson(Bearing bearing) {
    return {
      'name': bearing.name,
      'type': BearingTypes.values[bearing.type].index,
      'usage': bearing.usage,
      'startClearance': bearing.startClearance,
      'endClearance': bearing.endClearance,
      'isRadial': bearing.isRadial,
      'numCat': bearing.numCat,
      // 'image': bearing.image,
    };
  }
}
