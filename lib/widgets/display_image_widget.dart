import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/utils/colors.dart';

class DisplayImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onPressed;

  // Constructor
  const DisplayImage({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final color = Color.fromRGBO(50, 70, 130, 1);
    const color = AppColors.mainColor1;

    return Center(
        child: Stack(children: [
      buildImage(color),
      // Positioned(
      //   child: buildEditIcon(color),
      //   right: 4,
      //   top: 10,
      // )
    ]));
  }

  // Builds Profile Image
  Widget buildImage(Color color) {
    // final image = imagePath.contains('https://')
    //     ? NetworkImage(imagePath)
    //     : FileImage(File(imagePath));
    final image = AssetImage(imagePath);

    return CircleAvatar(
      radius: 75,
      backgroundColor: color,
      child: CircleAvatar(
        backgroundImage: image,
        radius: 70,
      ),
    );
  }

  // Builds Edit Icon on Profile Picture
  // Widget buildEditIcon(Color color) => buildCircle(
  //     all: 8,
  //     child: Icon(
  //       Icons.edit,
  //       color: color,
  //       size: 20,
  //     ));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.white,
        child: child,
      ));
}
