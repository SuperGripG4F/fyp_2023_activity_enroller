import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class ActivityPageBody extends StatefulWidget {
  const ActivityPageBody({super.key});

  @override
  State<ActivityPageBody> createState() => _ActivityPageBody();
}

class _ActivityPageBody extends State<ActivityPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!; //not going to be null
        //print("Current value is: " + _currPageValue.toString());
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
        //slider section
        //if any data updated , we will know in this builder.
        //popularProducts is the instance of controller
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              //itemCount: popularProducts.popularProductList.length,
              itemCount: 5,
              //position is 0 - 5 total 5 items
              itemBuilder: (context, position) {
                return _buildPageItem(
                  //position, popularProducts.popularProductList[position]);
                  position,
                );
              }),
        )
      ],
    );
  }

  //Widget _buildPageItem(int index, ProductModel popularProduct) {
  Widget _buildPageItem(int index) {
    //Transform anime
    Matrix4 matrix = Matrix4.identity();
    //check index
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      //
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      //1/2/220 = 22
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    //end Transform

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          //image
          GestureDetector(
            onTap: () {
              //Get.toNamed(RouteHelper.getPopularFood(index));
            },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: index.isEven
                      ? const Color(0xFF69c5df)
                      : const Color(0xFF9294cc),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/act1.png"),
                    //image: NetworkImage(popularProduct.img!),
                  )),
            ),
          ),
          //info
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.widhth30,
                  right: Dimensions.widhth30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                    ),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                  ]),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.widhth10,
                    right: Dimensions.widhth10),
                child: AppColumn(
                  text: '招募音樂人/Band 隊!!!',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
