import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../../../common/colors/colors.dart';
import '../../../../common/errors/failures.dart';
import '../../../../common/utils/ui.dart';
import '../../data/model/cat_model.dart';
import '../../domain/controller/load_all_cats_action.dart';

class CatsProvider with ChangeNotifier {
  LoadAllCatsAction loadAllCatsAction;

  CatsProvider({required this.loadAllCatsAction});

  List<CatModel> cats = [];
  List<CatModel> clickedCats = [];
  bool loading = false;

  loadAllCats(BuildContext context) async {
    loading = true;
    notifyListeners();

    Either<Failure, List<CatModel>> either = await loadAllCatsAction.call();
    either.fold(
      (l) => UiUtils.snackMessage(context, _getErrMsgFromFailure(l), AppColors.red),
      (r) => cats = r,
    );

    loading = false;
    notifyListeners();
  }

  clickCat(CatModel cat) {
    clickedCats.contains(cat) ? clickedCats.remove(cat) : clickedCats.add(cat);
    notifyListeners();
  }

  String _getErrMsgFromFailure(Failure l) {
    switch (l.runtimeType) {
      case ServerFailure:
        return 'Oops! server error!';
      case NoInternetFailure:
        return 'Oops! no internet connection!';
      default:
        return 'Unexpected error!';
    }
  }
}