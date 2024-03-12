import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moment/shared/widgets/buttons.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

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
                    _buildHeaderText('Sentimos sua falta!', 32.0),
                    const SizedBox(height: 12.0),
                    _buildHeaderText(
                        'Preencha seus dados para acessar sua conta.', 14.0),
                    const SizedBox(height: 24.0),
                    _buildTextField(' Usuário ', false),
                    const SizedBox(height: 12.0),
                    _buildTextField(' Senha ', true),
                    const SizedBox(height: 24.0),
                  ],
                ),
                _buildButtons(context),
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

  Widget _buildTextField(String label, bool isObscure) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black12, width: 0.5),
      ),
      child: TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: _inputBorder(),
          enabledBorder: _inputBorder(),
          focusedBorder: _inputBorder(),
          labelText: label,
          labelStyle: const TextStyle(
            backgroundColor: Colors.white,
            color: Colors.grey,
          ),
        ),
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
                builder: (context) => const AuthenticationView(),
              ),
            );
          },
          title: 'Continuar',
        ),
        const ATextButton(
          title: 'Esqueceu sua senha? Recupere-a!',
          titleSize: 14.0,
        ),
      ],
    );
  }
}
