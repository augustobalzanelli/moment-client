import 'package:flutter/material.dart';
import 'package:moment/shared/utils/colors.dart';

class AButtonStyles {
  static const double height = 54.0;
  static const BorderRadius borderRadius = BorderRadius.all(
    Radius.circular(50.0),
  );
  static const double fontSize = 16.0;
}

class AFilledButton extends StatelessWidget {
  final String title;

  const AFilledButton({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: AButtonStyles.height,
      decoration: const BoxDecoration(
        borderRadius: AButtonStyles.borderRadius,
        color: AAppColors.primaryColor,
      ),
      child: InkWell(
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: AButtonStyles.fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

class ATextButton extends StatelessWidget {
  final String title;
  final double? titleSize;

  const ATextButton({
    required this.title,
    this.titleSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: AButtonStyles.height,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: titleSize ?? AButtonStyles.fontSize,
          ),
        ),
      ),
    );
  }
}
