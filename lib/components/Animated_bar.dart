import 'package:flutter/material.dart';
import '../utils/colors.dart';

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(microseconds: 200),
        margin: const EdgeInsets.only(bottom: 2),
        height: 4,
        width: isActive ? 28 : 0,
        decoration: const BoxDecoration(
          color: AppColors.mainColor5,
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ));
  }
}
