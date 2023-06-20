import 'package:flutter/material.dart';
import '../../../../common/colors/colors.dart';

class IdChip extends StatelessWidget {
  final String id;
  const IdChip({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      color: AppColors.white.withOpacity(0.7),
      child: Text(id),
    );
  }
}