import '../../../../common/constants/strings.dart';
import '../model/cat_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class CatsRemoteRequests {
  Future<List<CatModel>> loadAllCatsRequest();
  // ...
}

class CatsRemoteRequestsImpl implements CatsRemoteRequests {
  @override
  Future<List<CatModel>> loadAllCatsRequest() async {
    final response = await http.get(
      Uri.parse(AppStrings.CATS_API_URL),
      headers: {"Content-type": "application/json"},
    );
    final List jsonList = convert.jsonDecode(response.body);
    final List<CatModel> cats = jsonList.map((c) => CatModel.fromJson(c)).toList();
    return cats;
  }
}