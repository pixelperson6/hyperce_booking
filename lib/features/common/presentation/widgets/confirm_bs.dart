import 'package:flutter/material.dart';

import '../../../../core/values/spacing.dart';

class ConfirmBs extends StatelessWidget {
  const ConfirmBs({
    super.key,
    required this.title,
    required this.cancelButtonName,
    required this.doneButtonName,
    required this.onCancel,
    required this.onDone,
    required this.theme,
  });

  final String title;
  final String cancelButtonName;
  final String doneButtonName;
  final VoidCallback onCancel;
  final VoidCallback onDone;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          padding: SSpacing.lgMargin,
          // height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: theme.textTheme.titleLarge),
              SSpacing.lgH,
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onCancel,
                      child: Text(cancelButtonName),
                    ),
                  ),
                  SSpacing.mdW,
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onDone,
                      child: Text(doneButtonName),
                    ),
                  ),
                ],
              ),
              SSpacing.jumboH,
            ],
          ),
        );
      },
    );
  }
}
