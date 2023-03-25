import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CircularProgress extends StatelessWidget {
  final double? height;

  CircularProgress({
    Key? key,
    this.height = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: height,
      ),
      const CircularProgressIndicator(
        color: AppColors.mainColor1,
      ),
      SizedBox(
        height: height,
      ),
    ]);
  }
}
