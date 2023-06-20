import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:weit_lovree_interview/features/cats/presentation/widget/titled_image.dart';

import '../state_manager/cats_provider.dart';

class CatsFancyGrid extends StatelessWidget {
  final CatsProvider catsPrv;

  const CatsFancyGrid({Key? key, required this.catsPrv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: catsPrv.cats.length,
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => catsPrv.clickCat(catsPrv.cats[index]),
          child: catsPrv.clickedCats.contains(catsPrv.cats[index])
              ? TitledImage(imgUrl: catsPrv.cats[index].url!, imgId: catsPrv.cats[index].id!)
              : Image.network(catsPrv.cats[index].url!),
        );
      },
    );
  }
}