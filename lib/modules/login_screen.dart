import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vinhome/apis/api_login.dart';
import 'package:vinhome/commons/widgets/hotline.dart';
import 'package:vinhome/commons/widgets/text_field.dart';
import 'package:vinhome/modules/register_screen.dart';
import 'package:vinhome/utils/color.dart';

import 'list_issue_screen/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  String _phone = '';
  String _password = '';

  void onChangeMobileTextField(String value) async {
    _phone = value;
  }

  void onChangePasswordTextField(String value) async {
    _password = value;
  }

  void onPressRegister() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()));
  }

  void onPressLogin() {
    login(_phone, _password, (data) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ListIssueScreen()));
    }, (messageE) {
      log('Message error $messageE');
    }, (error) {
      log('error $error');
    });
  }

  void onPressHotline() {
    if (kDebugMode) {
      print('Call hotline');
    }
  }

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final heightSafeArea = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        20;

    return Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: AppColor.backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(minHeight: heightSafeArea),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            VinTextField(
                              controller: _phoneController,
                              onChanged: onChangeMobileTextField,
                              labelText: 'Số điện thoại',
                            ),
                            const Padding(padding: EdgeInsets.all(8)),
                            VinTextField(
                              controller: _passwordController,
                              onChanged: onChangePasswordTextField,
                              labelText: 'Mật khẩu',
                            ),
                            const Padding(padding: EdgeInsets.all(15)),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: onPressRegister,
                                    style: TextButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 20)),
                                    child: Text(
                                      'Đăng ký',
                                      style: TextStyle(
                                        color: AppColor.blackColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    )),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: onPressLogin,
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColor.mainColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 35),
                                  ),
                                  child: Text(
                                    'Đăng nhập',
                                    style: TextStyle(
                                        color: AppColor.whiteColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ),
              VinHotline(
                onTapped: onPressHotline,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
