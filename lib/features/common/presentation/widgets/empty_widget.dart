import 'package:flutter/material.dart';

import '../../../../core/resource/app_assets.dart';
import '../../../../core/values/spacing.dart';
import 'preview_card_image.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SSpacing.colossalH,
          const PreviewCardImage(
            url: '',
            errorImage: AssetImage(SAppAssets.imagePlaceholder),
            height: 100,
            width: 200,
          ),
          SSpacing.xxxlH,
          Text(
            message ?? 'Empty Item',
            maxLines: 2,
            style: theme.textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
