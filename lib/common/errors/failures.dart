abstract class Failure {}

class NoInternetFailure extends Failure {
  String errMsg;
  NoInternetFailure({required this.errMsg});
}

class ServerFailure extends Failure {
  String errMsg;
  ServerFailure({required this.errMsg});
}

// ...