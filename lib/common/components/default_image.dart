import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:story_app/common/utils/utils.dart';
import 'default_circular_progress_indicator.dart';

class DefaultImage extends StatelessWidget {
  final String imageUrl, cacheKey;
  final String? cacheManagerKey;
  final Duration? staleImagePeriod;
  final Alignment? alignment;
  final double? width, height;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Color? color;
  final BoxFit? fit;
  final Widget? errorWidget;
  final bool isFromNetwork;

  const DefaultImage({
    super.key,
    required this.imageUrl,
    required this.cacheKey,
    this.width,
    this.height,
    this.cacheManagerKey,
    this.staleImagePeriod,
    this.alignment,
    this.imageBuilder,
    this.color,
    this.fit,
    this.errorWidget,
    this.isFromNetwork = true,
  });

  @override
  Widget build(BuildContext context) {
    return !isFromNetwork
        ? Image.file(
            File(imageUrl),
            width: width,
            height: height,
            alignment: alignment ?? Alignment.center,
            color: color,
            fit: fit,
            cacheHeight: height?.toInt(),
            cacheWidth: width?.toInt(),
            errorBuilder: (context, error, stackTrace) =>
                errorWidget ?? const Icon(Icons.error),
          )
        : CachedNetworkImage(
            cacheKey: cacheKey,
            imageUrl: imageUrl,
            height: height,
            width: width,
            alignment: alignment ?? Alignment.center,
            color: color,
            fit: fit,
            imageBuilder: imageBuilder,
            cacheManager: CacheManager(
              Config(
                cacheManagerKey ?? "image-cache-key",
                stalePeriod: staleImagePeriod ?? const Duration(days: 1),
              ),
            ),
            progressIndicatorBuilder: (context, url, progress) => CircleAvatar(
              backgroundColor: Colors.transparent,
              child: DefaultCircularProgressIndicator(
                value: progress.progress,
                color: AppColors.blackColor,
              ),
            ),
            errorWidget: (context, url, error) =>
                errorWidget ?? const Icon(Icons.error),
          );
  }
}
