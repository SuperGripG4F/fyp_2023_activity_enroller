import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/utils/app_constants.dart';
import 'package:fyp_2023_activity_enroller/widgets/big_text.dart';
import 'package:fyp_2023_activity_enroller/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/controllers/login_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonDisabled = false;

  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => LoginController(apiClient: Get.find()));
    tokenLogin();
  }

  Future<void> tokenLogin() async {
    // use the retrieved token to perform the login
    bool isLoginSuccess = await Get.find<LoginController>().tokenLogin();
    if (isLoginSuccess) {
      // ignore: use_build_context_synchronously
      // await alert(context, title: const Text('Login successful'));
      //const SnackBar(content: Text('Login successful'));
      Get.offNamed(RouteHelper.getInitial());
    }
  }

  void _handleButtonPress() async {
    if (_isButtonDisabled) {
      return;
    }

    setState(() {
      _isButtonDisabled = true;
    });

    // Send the post request here

    if (_formKey.currentState!.validate()) {
      if (await Get.find<LoginController>().login()) {
        Get.offNamed(
          RouteHelper.getInitial(),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
    await Future.delayed(const Duration(seconds: 5));

    if (mounted) {
      setState(() {
        _isButtonDisabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //auto login
    // Retrieve token from shared preferences
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/image/logo.png"),
              SizedBox(
                height: Dimensions.height20,
              ),
              BigText(
                text: "Login",
                size: 30,
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              SmallText(text: "Login to your account"),
              SizedBox(
                height: Dimensions.height10,
              ),
              //username input field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Username",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                        onChanged: (value) =>
                            Get.find<LoginController>().username.value = value,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your user name';
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              //password input field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 70,
                    child: TextFormField(
                        onChanged: (value) =>
                            Get.find<LoginController>().password.value = value,
                        obscureText: true,
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              MaterialButton(
                onPressed: _handleButtonPress,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.white,
                disabledElevation: 0,
                minWidth: double.infinity,
                height: 60,
                color: AppColors.mainColor3,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
