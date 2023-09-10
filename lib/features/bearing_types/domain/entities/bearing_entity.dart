import 'package:cylinders/features/bearing_types/presentation/widgets/bearing-types.dart';
import 'package:equatable/equatable.dart';

class Bearing extends Equatable {
  late String? ID;
  late String name;
  late int type;
  late String usage;
  late double startClearance;
  late double endClearance;
  late bool isRadial;
  late String numCat;
  late String? image;

  Bearing({
    this.ID,
    required this.name,
    required this.type,
    required this.usage,
    required this.startClearance,
    required this.endClearance,
    required this.isRadial,
    required this.numCat,
    this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        ID,
        name,
        type,
        usage,
        startClearance,
        endClearance,
        isRadial,
      ];
}

enum BearingTypes {
  Spherical,
  Cylindrical,
  AngularContact,
  DeepGroove,
  Thrust,
  Tapered,
  Needle
}

// List<String> bearingTypesArabic = BearingTypes.values;
