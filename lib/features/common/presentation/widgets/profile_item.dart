import 'package:flutter/material.dart';

import '../../../../core/values/spacing.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.onPress,
    required this.title,
    required this.icon,
    required this.color,
  });

  final VoidCallback onPress;
  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: SSpacing.mdMargin,
        margin: SSpacing.xsMarginH,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: theme.colorScheme.surfaceContainer,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              // size: 18,
              color: color,
            ),
            SSpacing.mdW,
            Expanded(child: Text(title, style: theme.textTheme.titleLarge)),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
