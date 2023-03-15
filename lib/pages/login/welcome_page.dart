//the
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fyp_2023_activity_enroller/widgets/big_text.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../routes/route_helper.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

//https://pub.dev/packages/introduction_screen

class _WelcomePageState extends State<WelcomePage> {
  // 1. Define a `GlobalKey` as part of the parent widget's state
  final _introKey = GlobalKey<IntroductionScreenState>();
  String _status = 'Waiting...';

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      // 2. Pass that key to the `IntroductionScreen` `key` param
      key: _introKey,
      pages: [
        PageViewModel(
            image: Image.asset("assets/image/logo.png", height: 175.0),
            title: 'Welcome ar, intro todo la',
            bodyWidget: Column(
              children: [
                Text(_status),
                ElevatedButton(
                    onPressed: () {
                      setState(() => _status = 'Going to the next page...');

                      // 3. Use the `currentState` member to access functions defined in `IntroductionScreenState`
                      Future.delayed(const Duration(seconds: 3),
                          () => _introKey.currentState?.next());
                    },
                    child: const Text('Start'))
              ],
            )),
        PageViewModel(
          title: 'Page Two',
          bodyWidget: const Text('That\'s all folks'),
          footer: ElevatedButton(
            onPressed: () {
              Get.offNamed(RouteHelper.getLogin());
            },
            child: const Text("Let's Go!"),
          ),
        ),
      ],
      showSkipButton: true,
      showNextButton: false,
      skip: const Text("Skip"),
      done: const Text("Done"),
      onDone: () {
        // On button pressed
        Get.offNamed(RouteHelper.getLogin());
      },
    );
  }
}
