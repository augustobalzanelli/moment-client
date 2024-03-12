import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:moment/core/constants/lottie_assets.dart';
import 'package:moment/features/authentication/presentation/views/registration_view.dart';
import 'package:moment/shared/widgets/buttons.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(120.0),
      child: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildBackButton(context),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Ink(
      height: 44.0,
      width: 44.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 0.5),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/icons/left_arrow.svg'),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double minimumHeight = screenHeight - 120 - statusBarHeight;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minimumHeight),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    _buildHeaderText('Verifique sua conta!', 32.0),
                    const SizedBox(height: 12.0),
                    _buildHeaderText(
                        'Informe o código que acabamos de enviar para balzanelli@proton.me.',
                        14.0),
                    const SizedBox(height: 24.0),
                    Stack(
                      children: [
                        Lottie.asset(ALottieAssets.mail),
                        _buildTextField('Código', false),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: _buildButtons(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );
  }

  Widget _buildTextField(String hint, bool isObscure) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black12, width: 0.5),
      ),
      child: TextField(
        obscureText: isObscure,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          border: _inputBorder(),
          enabledBorder: _inputBorder(),
          focusedBorder: _inputBorder(),
          counterText: '',
        ),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        maxLength: 6,
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide.none,
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        AFilledButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationView(),
              ),
            );
          },
          title: 'Verificar conta',
        ),
        ATextButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegistrationView(),
              ),
            );
          },
          title: 'E-mail errado? Arrume!',
          titleSize: 14.0,
        ),
      ],
    );
  }
}
