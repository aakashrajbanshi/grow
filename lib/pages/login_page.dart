import 'dart:developer';

import 'package:classapp/app/routes/routes.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/constants/image_constants.dart';
import 'package:classapp/helpers/snacks.dart';
import 'package:classapp/locator.dart';
import 'package:classapp/models/login_response_model.dart';
import 'package:classapp/pages/home_page.dart';
import 'package:classapp/services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.green,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _loginFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Image.network(
                        ImageConstants.appLogo,
                        height: 80,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        validator: (String? value) {
                          if (value == null || value.length < 10) {
                            return "Please enter a valid phone number.";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: "Phone number",
                            labelText: "Phone number",
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide())),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        validator: (String? value) {
                          if (value == null || value.length < 8) {
                            return "Password must be greater than or equal to 8 characters.";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            suffixIcon: GestureDetector(
                              child: Icon(Icons.visibility),
                              onLongPressStart: (val) {
                                setState(() {
                                  _isObscure = false;
                                });
                              },
                              onLongPressEnd: (val) {
                                setState(() {
                                  _isObscure = true;
                                });
                              },
                            ),

                            // suffixIcon: IconButton(
                            //     onPressed: () {
                            //       setState(() {
                            //         _isObscure = !_isObscure;
                            //       });
                            //     },
                            //     icon: Icon(
                            //       _isObscure
                            //           ? Icons.remove_red_eye
                            //           : Icons.visibility_off,
                            //     )),
                            prefixIcon: const Icon(Icons.fingerprint)),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            //validate form
                            if (_loginFormKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              //try login
                              AuthServices authServices = AuthServices();
                              LoginResponseModel? response =
                                  await authServices.login(
                                      _phoneController.text,
                                      _passwordController.text);
                              setState(() {
                                isLoading = false;
                              });
                              //check if response comes from the server
                              if (response == null) {
                                AppSnacks.showSnackBar(context,
                                    message: "No response from the server.");
                              } else if (response.data != null) {
                                locator.get<SharedPreferences>().setString(
                                    AppConstants.token, response.data!);
                                AppSnacks.showSnackBar(
                                  context,
                                );
                                Navigator.pushNamedAndRemoveUntil(context,
                                    AppRoutes.homeRoute, (route) => false);
                              }
                              // if user's credentials don't match
                              else {
                                AppSnacks.showSnackBar(context,
                                    message: "Invalid Credentials.");
                              }

                              // if user is logged in

                            }
                          },
                          child: Text("Login"))
                    ],
                  ),
                ),
              ),
            ),
            if (isLoading) ...{
              const Center(
                child: CircularProgressIndicator(),
              )
            }
          ],
        ),
      ),
    );
  }
}
