// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/components/side_menu_tile.dart';
import 'package:fyp_2023_activity_enroller/models/rive_asset.dart';
import 'package:rive/rive.dart';

import '../utils/rive_utils.dart';
import 'info_card.dart';

// ignore: prefer_const_constructors

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xFF17203A),
        child: SafeArea(
          child: Column(
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
                      // menu.input!.change(true);
                    },
                    riveonInit: (artboard) {
                      // StateMachineController controller =
                      //     RiveUtils.getRiveController(artboard,
                      //         stateMachineName: menu.stateMachineName);
                      //menu.input = controller.findSMI("active") as SMIBool;
                    },
                    isActive: false,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
