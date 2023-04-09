import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/pages/search/search_page_body.dart';
import 'package:fyp_2023_activity_enroller/widgets/header.dart';
import 'package:get/get.dart';

import '../../routes/bottomNav_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../home/activity_page_body.dart';
import '../../widgets/enrty_point.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              //showing the header
              HeaderInfo(title: 'Search'),
              const SearchPageBody(),
              // const Expanded(
              //     child: SingleChildScrollView(
              //   child: SearchPageBody(),
              // )),
            ],
          ),
        ),
        bottomNavigationBar: const EntryPoint());
  }
}
