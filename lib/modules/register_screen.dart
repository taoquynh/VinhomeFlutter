import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vinhome/commons/widgets/hotline.dart';
import 'package:vinhome/commons/widgets/text_field.dart';
import 'package:vinhome/utils/color.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  void onChangeMobileTextField(String value) async {}

  void onChangePasswordTextField(String value) async {}

  void onChangeConfirmPasswordTextField(String value) async {}

  void onPressRegister() {}

  void onPressHotline() {
    if (kDebugMode) {
      print('Call hotline');
    }
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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
        60;

    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColor.mainColor),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: AppColor.backgroundColor,
              padding: const EdgeInsets.only(bottom: 20),
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
                            width: 150,
                            height: 150,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              children: [
                                VinTextField(
                                  controller: _nameController,
                                  onChanged: onChangeMobileTextField,
                                  labelText: 'Họ & tên',
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                                VinTextField(
                                  controller: _emailController,
                                  onChanged: onChangePasswordTextField,
                                  labelText: 'Email',
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                                VinTextField(
                                  controller: _phoneController,
                                  onChanged: onChangePasswordTextField,
                                  labelText: 'Số điện thoại',
                                ),
                                const Padding(padding: EdgeInsets.all(8)),
                                VinTextField(
                                  controller: _passwordController,
                                  onChanged: onChangeConfirmPasswordTextField,
                                  labelText: 'Mật khẩu',
                                ),
                                const Padding(padding: EdgeInsets.all(15)),
                                Row(
                                  children: [
                                    const Spacer(),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: AppColor.mainColor,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 40),
                                      ),
                                      child: Text(
                                        'Đăng ký',
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
                            height: 200,
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
