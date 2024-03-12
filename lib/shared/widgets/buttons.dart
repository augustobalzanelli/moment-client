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
  final VoidCallback onTap;

  const AFilledButton({
    required this.title,
    required this.onTap,
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
        borderRadius: AButtonStyles.borderRadius,
        onTap: onTap,
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

class AContainedIconButton extends StatelessWidget {
  final Widget icon;
  const AContainedIconButton({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 44.0,
      width: 44.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
      ),
    );
  }
}
