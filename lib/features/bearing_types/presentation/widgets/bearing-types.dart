import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';

import '../../../../core/shared/strings/app_assets.dart';

class BearingType {
  static List<String> imageList = [
    AppAssets.cylindricalImage,
    AppAssets.angularImage,
    AppAssets.deepGrooveImage,
    AppAssets.thrustImage,
    AppAssets.sphericalImage,
    AppAssets.taperedImage,
  ];
  static List<Bearing> bearings = [
    Bearing(
      name: 'Cylindrical double row',
      type: BearingTypes.Cylindrical,
      usage:
          'it works on radial load only and it works fine with high speed invironment',
      startClearance: 0.15,
      endClearance: 0.30,
      isRadial: true,
      numCat: 'Like 313823',
      image: AppAssets.cylindricalImage,
    ),
    Bearing(
      name: 'Angular Contact ball bearing single row',
      type: BearingTypes.AngularContact,
      usage:
          'it works in both directions, axial and radial, but the prefered is axial directional and it works fine with high speed invironment',
      startClearance: 0.1,
      endClearance: 0.10,
      numCat: 'Like 7024',
      isRadial: true,
      image: AppAssets.angularImage,
    ),
    Bearing(
      name: 'Deep groove single row',
      type: BearingTypes.DeepGroove,
      usage:
          'it works in both directions, axial and radial, it works to prevent the vibrations on the area that\'s it works in,and it works fine with high speed invironment',
      startClearance: 0.1,
      endClearance: 0.10,
      numCat: 'Like 6024',
      isRadial: true,
      image: AppAssets.deepGrooveImage,
    ),
    Bearing(
      name: 'Spherical roller bearing',
      type: BearingTypes.Spherical,
      usage:
          'it works in both directiona, axial and radial, it works fine with high load invironment',
      startClearance: 0.15,
      endClearance: 0.35,
      numCat: 'Like 24052 tapered bore',
      isRadial: true,
      image: AppAssets.sphericalImage,
    ),
    Bearing(
      name: 'Thrust cylindrical roller bearing',
      type: BearingTypes.Thrust,
      usage:
          'it works in axial direction only, and it used for heavy axial loads versus of angular contact that works in axial and light radial load, it works fine with high load invironment',
      numCat: 'Like 3....',
      startClearance: 0.1,
      endClearance: 0.10,
      isRadial: false,
      image: AppAssets.thrustImage,
    ),
    Bearing(
      name: 'Tapered bearing',
      type: BearingTypes.Tapered,
      usage:
          'it works in both directions, axial and radial, the prefered working environment is in gearboxs and it works fine with heavy load invironment',
      numCat: 'Like 5.....',
      startClearance: 0.1,
      endClearance: 0.10,
      isRadial: true,
      image: AppAssets.taperedImage,
    ),
    Bearing(
      name: 'Needle roller bearing ',
      type: BearingTypes.Needle,
      usage:
          'it works in one direction, only radial, and it works fine with heavy load invironment',
      startClearance: 0.1,
      endClearance: 0.10,
      numCat: 'Like 6024',
      isRadial: true,
    ),
  ];
}
