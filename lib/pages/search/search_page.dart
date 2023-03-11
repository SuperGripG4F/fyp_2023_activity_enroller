import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/pages/search/search_page_body.dart';
import 'package:get/get.dart';

import '../../routes/bottomNav_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../home/activity_page_body.dart';
import '../home/enrty_point.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                //showing the header
                Container(
                  margin: const EdgeInsets.only(top: 45, bottom: 15),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            BigText(
                              text: AppConstants.APP_NAME,
                              color: AppColors.mainColor1,
                            ),
                            Row(
                              children: [
                                const SmallText(
                                  text: AppConstants.APP_VERSION,
                                  color: Colors.black54,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
                const Expanded(
                    child: SingleChildScrollView(
                  child: SearchPageBody(),
                )),
              ],
            )
          ],
        ),
        bottomNavigationBar: const EntryPoint());
  }
}
