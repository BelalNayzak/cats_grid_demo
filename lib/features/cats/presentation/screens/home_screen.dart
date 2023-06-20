import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/widgets/loading.dart';
import '../state_manager/cats_provider.dart';
import '../widget/cats_fancy_grid.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Interview Task Demo'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () =>
                  Provider.of<CatsProvider>(context, listen: false).loadAllCats(context),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'cats'),
              // ...
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Consumer<CatsProvider>(
              builder: (_, catsPrv, __) {
                if (catsPrv.loading) {
                  return const Loading();
                } else if (catsPrv.cats.isEmpty) {
                  return const Text('No cats found!');
                } else {
                  return CatsFancyGrid(catsPrv: catsPrv);
                }
              },
            ),
            // ...
          ],
        ),
      ),
    );
  }
}