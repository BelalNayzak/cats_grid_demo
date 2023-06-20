import 'package:get_it/get_it.dart';

import '../../features/cats/data/repository/cats_repo_impl.dart';
import '../../features/cats/data/request/cats_remote_requests.dart';
import '../../features/cats/domain/controller/load_all_cats_action.dart';
import '../../features/cats/domain/repository/cats_repo.dart';
import '../../features/cats/presentation/state_manager/cats_provider.dart';

final gtt = GetIt.instance;

Future<void> setupInjection() async {
  gtt.registerFactory<CatsProvider>(() => CatsProvider(loadAllCatsAction: gtt()));

  gtt.registerLazySingleton<LoadAllCatsAction>(() => LoadAllCatsAction(catsRepo: gtt()));

  gtt.registerLazySingleton<CatsRepo>(() => CatsRepoImpl(catsRemoteRequests: gtt()));

  gtt.registerLazySingleton<CatsRemoteRequests>(() => CatsRemoteRequestsImpl());

  // ...
}