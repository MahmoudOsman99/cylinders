import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> hasConnection();
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker checker;

  NetworkInfoImpl({required this.checker});
  @override
  Future<bool> hasConnection() async {
    return await checker.hasConnection;
  }
}
