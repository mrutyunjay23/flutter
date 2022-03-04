import 'dart:ui';
import 'package:e_commerce/authentication/login_screen/login_screen_controller.dart';
// import 'package:e_commerce/authentication/otp_verification_screen/otp_screen_view.dart';
import 'package:e_commerce/const/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final controller = Get.put(LoginScreenController());

    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          body: GetBuilder<LoginScreenController>(
              init: LoginScreenController(),
              builder: (value) {
                if (!value.isLoading) {
                  return SizedBox(
                    height: size.height,
                    width: size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                            child: Image.asset(
                              "assets/paras_logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            height: size.height / 10,
                          ),
                          Container(
                            height: size.height / 15,
                            width: size.width / 1.2,
                            padding: const EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromRGBO(9, 32, 196, 1))),
                            child: TextField(
                              controller: controller.phone,
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  counterText: ""),
                            ),
                          ),
                          SizedBox(
                            height: size.height / 10,
                          ),
                          CustomButton(
                            text: "Login / Signup",
                            function: () {
                              controller.verifyPhoneNumber();
                            },
                            buttonWidth: 2.2,
                            radius: BorderRadius.circular(10),
                          ),
                          SizedBox(
                            height: size.height / 5,
                          ),
                          const Center(
                            child: Text("Enter your phone number to get OTP"),
                          )
                        ],
                      ),
                    ),
                  );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
              }),
        ),
      ),
    );
  }
}
