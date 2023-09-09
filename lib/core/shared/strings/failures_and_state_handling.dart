import '../../error/failures.dart';
import '../app_text.dart';
import 'state_messages.dart';

class HandleFailureAndDoneMessage {
  static String mapStateToString(StateMessages msg) {
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

  static String mapFailureToString(Failure f) {
    switch (f.runtimeType) {
      case OfflineFailure:
        return 'Offline Error';
      case ServerFailure:
      default:
        return 'Server Error';
    }
  }
}
