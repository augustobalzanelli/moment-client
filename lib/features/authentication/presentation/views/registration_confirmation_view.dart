import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:moment/core/constants/lottie_assets.dart';
import 'package:moment/features/authentication/presentation/views/authentication_view.dart';
import 'package:moment/features/authentication/presentation/views/registration_view.dart';
import 'package:moment/shared/widgets/buttons.dart';

class RegistrationConfirmationView extends StatelessWidget {
  const RegistrationConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 120.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Boas vindas!',
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                    Text(
                        'Agora você está pronto para se aventurar com seu parceiro!'),
                  ],
                ),
              ),
              Container(
                child: Lottie.asset(ALottieAssets.coupleWalk),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: AFilledButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthenticationView(),
                  ),
                );
              },
              title: 'Vamos nessa!',
            ),
          )
          // <a href="https://iconscout.com/lottie-animations/couple-heart" class="text-underline font-size-sm" target="_blank">Couple Heart</a> by <a href="https://iconscout.com/contributors/robin-donvai" class="text-underline font-size-sm" target="_blank">Robin's Pixel</a>
        ],
      ),
    );
  }
}
