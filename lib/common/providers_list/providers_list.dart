import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/cats/presentation/state_manager/cats_provider.dart';
import '../injection/injector.dart';

class ProvidersList {
  static List<SingleChildWidget> createAppProviders() {
    return [
      ChangeNotifierProvider<CatsProvider>(
        lazy: false,
        create: (context) => CatsProvider(loadAllCatsAction: gtt())..loadAllCats(context),
      ),
      // ...
    ];
  }
}