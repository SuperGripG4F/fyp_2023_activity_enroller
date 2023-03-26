import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/data/repository/search_activity_repo.dart';
import 'package:get/get.dart';
import 'package:outline_search_bar/outline_search_bar.dart';

import '../../data/controllers/search_activity_controller.dart';
import '../../data/model/activity_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column_s.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => SeacrhActivityController(searchActivityRepo: Get.find()));
    Get.find<SeacrhActivityController>().getActivityList();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!; //not going to be null
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    //let the memory management system know that i don't need this thing just to remove them from the memory.
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: Dimensions.widhth20, right: 20),
          child: OutlineSearchBar(
            hintText: 'Search... ',
            onKeywordChanged: (value) => setState(() => _searchTerm = value),
          ),
        ),
        GetBuilder<SeacrhActivityController>(builder: (searchActivity) {
          if (searchActivity.isLoaded) {
            List allActivity = searchActivity.ActivityList;
            if (kDebugMode) {
              print("search term:" + _searchTerm);
            }
            List filteredActivity = allActivity
                .where((allActivity) => allActivity.titleEn
                    .toLowerCase()
                    .contains(_searchTerm.toLowerCase()))
                .toList();
            if (kDebugMode) {
              print("filteredActivity :" + filteredActivity.length.toString());
            }

            return filteredActivity.length == allActivity.length
                ? Container()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredActivity.length,
                    itemBuilder: (context, index) {
                      ActivityModel activityModel = filteredActivity[index]!;
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(
                              RouteHelper.getActivityDetail(activityModel.id!));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.widhth20,
                              right: Dimensions.widhth20,
                              bottom: Dimensions.height10),
                          child: Row(
                            children: [
                              Container(
                                  width: Dimensions.listViewImgSize,
                                  height: Dimensions.listViewImgSize,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        Dimensions.radius20,
                                      ),
                                      color: Colors.white38,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.IMG_PATH +
                                                  activityModel.poster!)))),
                              //focus the widget to get all available space
                              Expanded(
                                child: Container(
                                  height: Dimensions.listViewTextContSize,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(
                                            Dimensions.radius20),
                                        bottomRight: Radius.circular(
                                            Dimensions.radius20)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: Dimensions.height1,
                                      left: Dimensions.widhth10,
                                      right: Dimensions.widhth10,
                                      bottom: Dimensions.height1,
                                    ),
                                    child: AppColumnSmall(
                                        text: activityModel.titleEn!,
                                        stars: activityModel.stars!,
                                        comments_num: activityModel.comments!,
                                        date: activityModel.dates![0].date!,
                                        day: activityModel.dates![0].day!,
                                        time:
                                            activityModel.dates![0].startTime!,
                                        location: activityModel.location!),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
          }

          return Container();

          Container();
        }),
      ],
    );
  }
}
