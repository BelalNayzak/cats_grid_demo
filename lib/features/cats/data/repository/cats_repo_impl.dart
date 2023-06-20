import 'package:dartz/dartz.dart';

import '../../../../common/errors/exceptions.dart';
import '../../../../common/errors/failures.dart';
import '../../data/model/cat_model.dart';
import '../../domain/repository/cats_repo.dart';
import '../request/cats_remote_requests.dart';

class CatsRepoImpl implements CatsRepo {
  CatsRemoteRequests catsRemoteRequests;

  CatsRepoImpl({required this.catsRemoteRequests});

  @override
  Future<Either<Failure, List<CatModel>>> loadAllCats() async {
    try {
      List<CatModel> cats = await catsRemoteRequests.loadAllCatsRequest();
      return Right(cats);
    } on ServerException {
      return Left(ServerFailure(errMsg: 'Oops! server error'));
    }
  }
}