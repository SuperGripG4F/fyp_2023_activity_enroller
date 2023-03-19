import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/routes/bottomNav_helper.dart';
import 'package:fyp_2023_activity_enroller/utils/colors.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../components/Animated_bar.dart';
import '../data/model/rive_asset.dart';
import '../routes/bottomNav_helper.dart';
import '../routes/route_helper.dart';
import '../utils/rive_utils.dart';
import '../pages/search/search_page.dart';
import '../pages/home/main_activity_page.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final BottomNavHelper bottomNavHelper = Get.find<BottomNavHelper>();

  RiveAsset selectedBottomNav = bottomNavs.first;
  @override
  Widget build(BuildContext context) {
    selectedBottomNav = bottomNavs[bottomNavHelper.pageValue];

    return Container(
      padding: const EdgeInsets.only(bottom: 25, top: 12, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: AppColors.mainColor1,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(
              bottomNavs.length,
              (index) => GestureDetector(
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index] != selectedBottomNav) {
                        setState(() {
                          selectedBottomNav = bottomNavs[index];
                          bottomNavHelper.pageValue = index;
                          if (bottomNavHelper.pageValue == 0) {
                            Get.offNamed(
                              RouteHelper.getInitial(),
                            );
                          } else if (bottomNavHelper.pageValue == 1) {
                            if (kDebugMode) {
                              print(Get.routing);
                            }
                            Get.offNamed(RouteHelper.getSearchActivity());
                          } else if (bottomNavHelper.pageValue == 3) {
                            if (kDebugMode) {
                              print(Get.routing);
                            }
                            Get.offNamed(RouteHelper.getAnnouncement());
                          }
                        });
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        bottomNavs[index].input!.change(false);
                      });
                      //print(index.toString() + " taped ");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBar(
                          isActive: bottomNavs[index] == selectedBottomNav,
                        ),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity: bottomNavs[index] == selectedBottomNav
                                ? 1
                                : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(artboard,
                                        stateMachineName:
                                            bottomNavs[index].stateMachineName);
                                bottomNavs[index].input =
                                    controller.findSMI("active") as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
