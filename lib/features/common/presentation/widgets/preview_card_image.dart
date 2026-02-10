import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/resource/app_assets.dart';

class PreviewCardImage extends StatelessWidget {
  final String url;

  final ImageProvider errorImage;

  final double width;
  final double height;
  final double radius;
  final BoxFit boxFit;

  const PreviewCardImage({
    super.key,
    required this.url,
    this.errorImage = const AssetImage(SAppAssets.imagePlaceholder),
    this.width = 100,
    this.height = 100,
    this.radius = 0,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
        child: Image(image: imageProvider, fit: boxFit),
      ),
      placeholder: (context, url) =>
          CupertinoActivityIndicator(color: theme.primaryColor),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          // color: Get.theme.primaryColor,
        ),
        child: Image(image: errorImage, fit: boxFit),
      ),
    );
  }
}
