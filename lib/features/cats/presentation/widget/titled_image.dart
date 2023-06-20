import 'package:flutter/material.dart';

import 'id_chip.dart';

class TitledImage extends StatelessWidget {
  final String imgUrl;
  final String imgId;

  const TitledImage({Key? key, required this.imgUrl, required this.imgId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(imgUrl),
        IdChip(id: imgId),
      ],
    );
  }
}