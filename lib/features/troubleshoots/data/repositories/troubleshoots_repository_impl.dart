import 'package:cylinders/core/error/exceptions.dart';
import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/core/network/internet_info.dart';

import 'package:dartz/dartz.dart';

import '../../domain/entities/troubleshoot.dart';
import '../../domain/repositories/troubleshoot_repository.dart';
import '../datasources/remote/troubleshoots_remote_data.dart';

class TroubleshootRepositoryImpl extends TroubleshootRepository {
  final NetworkInfo netInfo;
  final TroubleshootsRemoteDataSource troubleshootRemote;
  TroubleshootRepositoryImpl({
    required this.netInfo,
    required this.troubleshootRemote,
  });

  @override
  Future<Either<Failure, List<Troubleshoot>>> getAllTroubleshoots() async {
    try {
      return Right(await troubleshootRemote.getAllTroubleshoots());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addTroubleshoot(
      Troubleshoot troubleshoot) async {
    try {
      return Right(await troubleshootRemote.addTroubleshoot(troubleshoot));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTroubleshoot(
      {required String docID, required Troubleshoot troubleshoot}) async {
    try {
      return Right(await troubleshootRemote.updateTroubleshoot(
          troubleshoot: troubleshoot, docID: docID));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
