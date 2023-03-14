import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                onChanged: (value) =>
                    Get.find<LoginController>().email.value = value,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                onChanged: (value) =>
                    Get.find<LoginController>().password.value = value,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await Get.find<LoginController>().login();
                  }
                },
                child: const Text('Login'),
              ),

              // Obx(
              //   () => Text(
              //     Get.find<LoginController>().errorMessage.value,
              //     style: TextStyle(color: Colors.red),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
