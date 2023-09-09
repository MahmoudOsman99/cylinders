import 'package:bloc/bloc.dart';
import 'package:cylinders/core/error/failures.dart';
import 'package:cylinders/core/shared/app_text.dart';
import 'package:cylinders/core/shared/strings/state_messages.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/troubleshoot.dart';
import '../../domain/usecases/add_troubleshoots_usecase.dart';
import '../../domain/usecases/all_troubleshoots_usecase.dart';
import '../../domain/usecases/update_troubleshoots_usecase.dart';

part 'troubleshoots_state.dart';

class TroubleshootsCubit extends Cubit<TroubleshootsState> {
  final GetAllTroubleshootsUsecase getAllTroubleshootsUsecase;
  final AddTroubleshootUseCase addTroubleshootUsecase;
  final UpdateTroubleshootUseCase updateTroubleshootUsecase;
  TroubleshootsCubit({
    required this.getAllTroubleshootsUsecase,
    required this.addTroubleshootUsecase,
    required this.updateTroubleshootUsecase,
  }) : super(TroubleshootsInitial());

  static TroubleshootsCubit get(context) => BlocProvider.of(context);

  Future<void> getAllTroubleshoots() async {
    Either<Failure, List<Troubleshoot>> process =
        await getAllTroubleshootsUsecase();
    emit(
      process.fold(
        (failure) =>
            TroubleshootsErrorState(error: _mapFailureToString(failure)),
        (troubleshoots) =>
            TroubleshootsLoadedState(troubleshoots: troubleshoots),
      ),
    );
  }

  Future<void> addTroubleshoot(Troubleshoot troubleshoot) async {
    Either<Failure, Unit> process = await addTroubleshootUsecase(troubleshoot);
    emit(
      process.fold(
        (failure) =>
            TroubleshootsErrorState(error: _mapFailureToString(failure)),
        (_) => TroubleshootsAddedState(
            message: _mapStateToString(StateMessages.added)),
      ),
    );
    getAllTroubleshoots();
  }

  Future<void> updateTroubleshoot(
      {required String docID, required Troubleshoot troubleshoot}) async {
    Either<Failure, Unit> process = await updateTroubleshootUsecase(
        docID: docID, troubleshoot: troubleshoot);
    emit(
      process.fold(
        (failure) =>
            TroubleshootsErrorState(error: _mapFailureToString(failure)),
        (_) => TroubleshootsUpdatedState(
            message: _mapStateToString(StateMessages.updated)),
      ),
    );
    getAllTroubleshoots();
  }

  Future uploadImage() async {
    FirebaseStorage storage =
        FirebaseStorage.instanceFor(bucket: 'gs://cylinders-53542.appspot.com');
  }

  Future pickImage() async {
    var picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    print(image!.path);
  }

  String _mapStateToString(StateMessages msg) {
    switch (msg) {
      case StateMessages.added:
        return AppText.addedSuccessfullyTextArabic;
      case StateMessages.deleted:
        return AppText.deletedSuccessfullyTextArabic;
      case StateMessages.updated:
        return AppText.updatedSuccessfullyTextArabic;
      default:
        return AppText.doneSuccessfullyTextArabic;
    }
  }

  String _mapFailureToString(Failure f) {
    switch (f.runtimeType) {
      case OfflineFailure:
        return 'Offline Error';
      case ServerFailure:
      default:
        return 'Server Error';
    }
  }
}
