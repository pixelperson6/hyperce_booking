import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/values/dimension.dart';
import '../../../../core/values/spacing.dart';

class EmptyActionWidget extends StatelessWidget {
  const EmptyActionWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.buttonText,
  });

  final String image;
  final String title;
  final String subtitle;
  final VoidCallback? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: SSpacing.lgMargin,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(SDimension.lg),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: SDimension.epic * 5,
            width: SDimension.epic * 3,
            fit: BoxFit.cover,
          ),
          SSpacing.lgH,
          Text(
            title,
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SSpacing.smH,
          Text(
            subtitle,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.outline,
            ),
            textAlign: TextAlign.center,
          ),
          SSpacing.xlH,
          if (onPressed != null)
            ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
        ],
      ),
    );
  }
}
