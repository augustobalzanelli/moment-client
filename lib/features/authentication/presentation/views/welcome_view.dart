import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moment/core/constants/lottie_assets.dart';
import 'package:moment/features/authentication/presentation/views/authentication_view.dart';
import 'package:moment/shared/widgets/buttons.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 45,
            child: Container(
              child: Lottie.asset(ALottieAssets.coupleHeart),
            ),
          ),
          // <a href="https://iconscout.com/lottie-animations/couple-heart" class="text-underline font-size-sm" target="_blank">Couple Heart</a> by <a href="https://iconscout.com/contributors/robin-donvai" class="text-underline font-size-sm" target="_blank">Robin's Pixel</a>
          Expanded(
            flex: 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dois Corações,',
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      ),
                      Text(
                        'Uma Aventura',
                        style: TextStyle(
                          fontSize: 40.0,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 24.0,
                  ),
                  child: Column(
                    children: [
                      AFilledButton(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthenticationView(),
                            ),
                          );
                        },
                        title: 'Continuar',
                      ),
                      const ATextButton(
                        title: 'Primeira vez? Registre-se!',
                        titleSize: 14.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
