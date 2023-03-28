// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/joined_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/data/controllers/popular_activity_controller.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';

import 'package:get/get.dart';
import 'package:native_dialog/native_dialog.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_column_detail.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class HistoryActivityDetail extends StatefulWidget {
  int pageId;

  HistoryActivityDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  State<HistoryActivityDetail> createState() => _HistoryActivityDetailState();
}

class _HistoryActivityDetailState extends State<HistoryActivityDetail> {
  double _rating = 0;
  TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var activityModel =
        Get.find<JoinedActivityController>().joinedActivityList[widget.pageId];
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
                      margin:
                          const EdgeInsets.only(top: 10, right: 30, left: 30),
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
            //Background Img
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
            child: Container(
              margin: EdgeInsets.only(
                  right: Dimensions.widhth20, left: Dimensions.widhth20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumnDetail(
                      activityModel: activityModel,
                    ),
                    SizedBox(height: Dimensions.height10),
                    BigText(text: 'Rating:', size: Dimensions.font20),
                    SizedBox(height: Dimensions.height10),
                    RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      maxRating: 5,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 30.0,
                      tapOnlyMode: true,
                      // ignore: prefer_const_constructors
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          _rating = rating;
                        });
                      },
                    ),
                    SizedBox(height: Dimensions.height10),
                    BigText(text: 'Comment:', size: Dimensions.font16),
                    SizedBox(height: Dimensions.height10),
                    TextField(
                      controller: _commentController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'Write your comment here...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            // Handle submit action, like saving the comment and rating to the database
                            // _rating = int.parse(_rating);
                            print(
                                'Submitted: Rating: $_rating.toInt(), Comment: ${_commentController.text}');
                            if (_rating != 0.0 ||
                                _commentController.text != '') {
                              final success =
                                  await Get.find<JoinedActivityController>()
                                      .postComment(
                                          activityModel.id.toString(),
                                          _rating.toString(),
                                          _commentController.text);
                              if (success) {
                                QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.success,
                                  text: 'Submit successful',
                                  confirmBtnColor: AppColors.mainColor5,
                                );
                              }
                            } else {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.warning,
                                text:
                                    'Please write your comment or Rating first',
                                confirmBtnColor: AppColors.mainColor5,
                              );
                            }
                          },
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.white,
                          disabledElevation: 0,
                          minWidth: 300,
                          height: 60,
                          color: AppColors.mainColor4,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
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
