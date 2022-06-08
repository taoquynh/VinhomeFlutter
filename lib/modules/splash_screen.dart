import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vinhome/modules/login_screen.dart';

import '../commons/consts/secure_storage.dart';
import 'list_issue_screen/index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isLogin;
  late Timer _timer;
  int _start = 3;

  Future<void> getIsLogin(Function(bool) onSuccess) async {
    String? value = await storage.read(key: loginStorage);
    if (value != null) {
      onSuccess(true);
    } else {
      onSuccess(false);
    }
  }

  void startTimer(Function(bool) onDone) {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          onDone(true);
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    getIsLogin((isLogin) {
      startTimer((isDone) {
        if (isDone) {
          if (isLogin) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListIssueScreen()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
