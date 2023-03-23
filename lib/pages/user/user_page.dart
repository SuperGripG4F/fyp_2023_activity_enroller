import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/user_info_controller.dart';
import 'package:fyp_2023_activity_enroller/widgets/big_text.dart';
import 'package:fyp_2023_activity_enroller/widgets/enrty_point.dart';
import 'package:fyp_2023_activity_enroller/widgets/header.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../data/model/user_model.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/display_image_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    Get.find<UserInfoController>().getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header_info(),
            Center(
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BigText(
                    text: "Profile",
                    size: 32,
                  )),
            ),
            DisplayImage(
              imagePath: "assets/image/user.png",
              onPressed: () {},
            ),
            buildUserInfoDisplay('username', 'User name'),
            buildUserInfoDisplay('email', 'Email'),
            buildUserInfoDisplay('firstname', 'First name'),
            buildUserInfoDisplay('lastname', 'Last name'),
            buildUserInfoDisplay('phone', 'Phone'),
          ],
        ),
      ),
      bottomNavigationBar: const EntryPoint(),
    );
  }

  Widget buildUserInfoDisplay(String getValue, String title) {
    return GetBuilder<UserInfoController>(builder: (UserInfoController) {
      return UserInfoController.isLoaded
          ? Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Container(
                      width: 350,
                      height: 40,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ))),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    // navigateSecondPage(editPage);
                                  },
                                  child: SmallText(
                                    text: UserInfoController.userInfo[getValue],
                                    size: 16,
                                  ))),
                        ],
                      ))
                ],
              ))
          : Column(children: [
              SizedBox(
                height: Dimensions.height30,
              ),
              const CircularProgressIndicator(
                color: AppColors.mainColor1,
              ),
              SizedBox(
                height: Dimensions.height30,
              ),
            ]);
    });
  }
}
