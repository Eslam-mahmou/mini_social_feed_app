import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String errorMessage;
  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure implements Exception {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-credential':
        return ServerFailure(errorMessage: 'User not found');
      case 'invalid-email':
        return ServerFailure(errorMessage: 'Email is not valid');
      case 'user-disabled':
        return ServerFailure(errorMessage: 'User disabled');
      case 'user-not-found':
        return ServerFailure(errorMessage: 'User not found');
      case 'wrong-password':
        return ServerFailure(errorMessage: 'Incorrect password');
      case 'email-already-in-use':
        return ServerFailure(errorMessage: 'Email already in use');
      case 'operation-not-allowed':
        return ServerFailure(errorMessage: 'Operation not allowed');
      case 'weak-password':
        return ServerFailure(errorMessage: 'Password is too weak');
      default:
        return ServerFailure(errorMessage: e.message ?? 'Some error occurred');
    }
  }

  factory ServerFailure.fromDioException(DioException dioExep) {
    switch (dioExep.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad SSL certificate error');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'No internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(errorMessage: 'Unexpected error, please try again');
      default:
        return ServerFailure(errorMessage: 'Something went wrong');
    }
  }
}
