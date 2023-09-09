import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/core/network/internet_info.dart';
import 'package:cylinders/features/bearing_types/data/datasources/remote/bearing_remote_datasource.dart';
import 'package:cylinders/features/bearing_types/domain/entities/bearing_entity.dart';
import 'package:cylinders/features/bearing_types/domain/repositories/bearing_repository.dart';
import 'package:dartz/dartz.dart';

class BearingRepositoryImpl extends BearingRepository {
  final NetworkInfo networkInfo;
  final BearingRemoteDataSource bearingRemote;

  BearingRepositoryImpl({
    required this.networkInfo,
    required this.bearingRemote,
  });

  @override
  Future<Either<Failure, Unit>> addBearing(Bearing bearing) async {
    // TODO: check the intenet connection to submit the local or network;
    try {
      return Right(await bearingRemote.addBearing(bearing: bearing));
    } catch (e) {
      return Left(OfflineFailure());
    }
  }
}
