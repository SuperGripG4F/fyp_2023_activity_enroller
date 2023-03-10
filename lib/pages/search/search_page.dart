import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/pages/search/search_page_body.dart';

import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../home/activity_page_body.dart';
import '../home/enrty_point.dart';

class MySearchPage extends StatefulWidget {
  final List<String> data; // 数据源

  MySearchPage({required this.data});

  @override
  _MySearchPageState createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResult = [];

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
                Expanded(
                    child: SingleChildScrollView(
                  child: SearchPageBody(),
                )),
              ],
            )
          ],
        ),
        bottomNavigationBar: const EntryPoint());
  }

  void _search(String query) {
    List<String> results = [];
    // 根据搜索查询过滤数据
    widget.data
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .forEach((item) {
      results.add(item);
    });
    // 更新状态以显示搜索结果
    setState(() {
      _searchResult = results;
    });
  }
}
