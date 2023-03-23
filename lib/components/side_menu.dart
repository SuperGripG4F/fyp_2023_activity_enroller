// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/components/side_menu_tile.dart';
import 'package:fyp_2023_activity_enroller/data/model/rive_asset.dart';
import 'package:rive/rive.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/rive_utils.dart';
import 'info_card.dart';

// ignore: prefer_const_constructors

class SideMenu extends StatefulWidget {
  const SideMenu({
    super.key,
  });

  @override
  State<SideMenu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                name: "Wong",
                profession: "Student",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text("Browse",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70)),
              ),
              ...sideMenus.map((menu) => SideMenuTile(
                    menu: menu,
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(Duration(seconds: 1), () {
                        menu.input!.change(false);
                      });
                      setState(() {
                        selectedMenu = menu;
                      });
                    },
                    riveonInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    isActive: selectedMenu == menu,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text("Histroy",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white70)),
              ),
              ...sideMenus2.map((menu) => SideMenuTile(
                    menu: menu,
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(Duration(seconds: 1), () {
                        menu.input!.change(false);
                      });

                      setState(() {
                        selectedMenu = menu;
                      });
                    },
                    riveonInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard,
                              stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI("active") as SMIBool;
                    },
                    isActive: selectedMenu == menu,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
