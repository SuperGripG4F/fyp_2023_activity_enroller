// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/popular_activity_controller.dart';

import 'package:get/get.dart';
import 'package:native_dialog/native_dialog.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../data/controllers/search_activity_controller.dart';
import '../../data/model/activity_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_column_detail.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class ActivityDetail extends StatefulWidget {
  String activityId;

  ActivityDetail({Key? key, required this.activityId}) : super(key: key);

  @override
  State<ActivityDetail> createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  @override
  void initState() {
    super.initState();
    Get.find<SeacrhActivityController>().getActivityDetail(widget.activityId);

    // activityModel = Get.find<SeacrhActivityController>().activityModel;
  }

  @override
  Widget build(BuildContext context) {
    // print(Get.find<SeacrhActivityController>().isModeldetailLoaded);
    // print(Get.find<SeacrhActivityController>().activityModel.titleEn);

    return GetBuilder<SeacrhActivityController>(builder: (searchActivity) {
      if (searchActivity.isModeldetailLoaded) {
        ActivityModel activityModel = searchActivity.activityModel;
        return Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                collapsedHeight: 100,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: AppIcon(icon: Icons.clear)),
                  ],
                ),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(20),
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimensions.radius20),
                              topRight: Radius.circular(Dimensions.radius20))),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 10, right: 30, left: 30),
                          width: 60,
                          height: 5,
                          decoration: BoxDecoration(
                              color: AppColors.mainColor1,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    )),
                expandedHeight: 300,
                backgroundColor: AppColors.mainColor1,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return DetailScreen(activityModel: activityModel);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            AppConstants.IMG_PATH + activityModel.poster!),
                      )),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        right: Dimensions.widhth20, left: Dimensions.widhth20),
                    child: AppColumnDetail(
                      activityModel: activityModel,
                    ),
                  ),
                ],
              ))
            ],
          ),
          bottomNavigationBar: Container(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                height: Dimensions.height120,
                padding: EdgeInsets.only(
                    top: Dimensions.height30,
                    bottom: Dimensions.height30,
                    left: Dimensions.widhth20,
                    right: Dimensions.widhth20),
                decoration: BoxDecoration(
                    color: AppColors.buttionbackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          Dimensions.radius20 * 2,
                        ),
                        topRight: Radius.circular(Dimensions.radius20 * 2))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //love icon
                    Container(
                        // padding: EdgeInsets.only(
                        //     top: Dimensions.height20,
                        //     bottom: Dimensions.height20,
                        //     left: Dimensions.widhth20,
                        //     right: Dimensions.widhth20),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(Dimensions.radius20),
                        //     color: Colors.white),
                        // child: Icon(
                        //   Icons.favorite,
                        //   color: AppColors.mainColor1,
                        // ),
                        ),
                    GestureDetector(
                      onTap: () async {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.confirm,
                            text:
                                "Are you confirm to participate ${activityModel.titleEn}?",
                            confirmBtnText: 'Yes',
                            cancelBtnText: 'No',
                            confirmBtnColor: AppColors.mainColor5,
                            onConfirmBtnTap: () async {
                              if (kDebugMode) {
                                print("confirm");
                              }
                              Navigator.of(context, rootNavigator: true).pop();
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.loading,
                                title: 'Loading',
                              );
                              final statuscode =
                                  await Get.find<PopularActivityController>()
                                      .joinActivity(activityModel.id);
                              Navigator.of(context, rootNavigator: true).pop();

                              print("statuscode: $statuscode");
                              if (statuscode == 302) {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.warning,
                                  text: 'Already participated',
                                  confirmBtnColor: AppColors.mainColor5,
                                );
                              } else if (statuscode == 201) {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: 'participate successful',
                                  confirmBtnColor: AppColors.mainColor5,
                                );
                              } else {
                                QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    confirmBtnColor: AppColors.mainColor5);
                              }
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            top: Dimensions.height20,
                            bottom: Dimensions.height20,
                            left: Dimensions.widhth20,
                            right: Dimensions.widhth20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                            color: AppColors.mainColor1),
                        child: BigText(
                          text: "Join Now",
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        );
      } else {
        return Scaffold();
      }
    });
  }
}

class DetailScreen extends StatelessWidget {
  var activityModel;

  DetailScreen({Key? key, required this.activityModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          color: AppColors.mainColor1,
          child: Center(
            child: Image(
                image: NetworkImage(
                    AppConstants.IMG_PATH + activityModel.poster!)),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
