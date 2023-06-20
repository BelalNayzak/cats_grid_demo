import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weit_lovree_interview/common/injection/injector.dart';
import 'package:weit_lovree_interview/common/router/routing.dart';
import 'package:weit_lovree_interview/features/cats/presentation/screens/home_screen.dart';

import 'common/providers_list/providers_list.dart';
import 'features/cats/presentation/state_manager/cats_provider.dart';

void main() async {
  await setupInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProvidersList.createAppProviders(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.id,
        routes: Routing.routes(),
      ),
    );
  }
}