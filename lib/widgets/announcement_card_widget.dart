import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';

import '../data/model/announcements.dart';
import '../utils/colors.dart';
import 'big_text_softwrap.dart';

class Announcement_card_widget extends StatelessWidget {
  final AnnouncementModel announcementModel;
  final int index;

  Announcement_card_widget(
      {super.key, required this.announcementModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(
            width: 1.0,
            color: AppColors.textColor,
          ),
        )),
        child: InkWell(
          splashColor: AppColors.mainColor3,
          onTap: () {
            debugPrint('Card tapped.');
          },
          child: SizedBox(
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                const Icon(
                  Icons.mail,
                  color: AppColors.mainColor2,
                  size: 30,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SmallText(
                              text: announcementModel.activityName ??
                                  "Activity name",
                              size: 15,
                              color: AppColors.mainColor5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 300,
                              child: BigTextSoftWrap(
                                text:
                                    announcementModel.title ?? "Activity title",
                                color: AppColors.BigTextColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            SmallText(
                              text:
                                  announcementModel.createdDate ?? "2023-03-25",
                              size: 15,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}
