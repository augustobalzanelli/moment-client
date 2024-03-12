import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moment/features/authentication/presentation/views/authentication_view.dart';
import 'package:moment/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/jsons/butterfly.json',
          onLoaded: (composition) {
            Future.delayed(composition.duration).then((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AuthenticationView()),
              );
            });
          },
        ),
      ),
    );
  }
}
