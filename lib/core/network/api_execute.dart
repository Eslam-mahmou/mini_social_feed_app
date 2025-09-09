import 'dart:developer';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../common/result.dart';
import '../error/failure.dart';
import '../utils/app_constant.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall) async {
  try {
    bool isConnected = await InternetConnectionChecker.instance.hasConnection;
    if (!isConnected) {
      return Error(AppConstants.internetConnectionError);
    }

    final result = await apiCall();
    return Success(result);

  } on FirebaseAuthException catch (ex) {
    log("FirebaseAuthException code: ${ex.code}");
    log("FirebaseAuthException message: ${ex.message ?? ''}");
    final failure = ServerFailure.fromFirebaseAuth(ex);
    return Error(failure.errorMessage);

  } catch (ex, stackTrace) {
    log("Unknown exception: ${ex.toString()}");
    log("StackTrace: $stackTrace");
    return Error(ex.toString());
  }
}
