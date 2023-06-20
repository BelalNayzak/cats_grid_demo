import 'package:dartz/dartz.dart';

import '../../../../common/errors/failures.dart';
import '../../data/model/cat_model.dart';

abstract class CatsRepo {
  Future<Either<Failure, List<CatModel>>> loadAllCats();
  // ...
}