import 'package:dartz/dartz.dart';

import '../../../../common/errors/failures.dart';
import '../../data/model/cat_model.dart';
import '../repository/cats_repo.dart';

class LoadAllCatsAction {
  CatsRepo catsRepo;

  LoadAllCatsAction({required this.catsRepo});

  Future<Either<Failure, List<CatModel>>> call() async => catsRepo.loadAllCats();
}