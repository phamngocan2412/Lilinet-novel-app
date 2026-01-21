import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'loading_indicator.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double? borderRadius;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // Show error widget immediately if URL is invalid
    if (imageUrl.isEmpty ||
        imageUrl == 'null' ||
        imageUrl == 'undefined' ||
        imageUrl.contains('originalnull') ||
        imageUrl.contains('originalundefined')) {
      final errorWidget = Container(
        width: width,
        height: height,
        color: Colors.grey[800],
        child: const Icon(Icons.broken_image, color: Colors.white54),
      );

      if (borderRadius != null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius!),
          child: errorWidget,
        );
      }
      return errorWidget;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final devicePixelRatio = MediaQuery.maybeOf(context)?.devicePixelRatio ?? 1.0;

        int? cacheWidth;
        if (width != null && width!.isFinite) {
          cacheWidth = (width! * devicePixelRatio).toInt();
        } else if (constraints.maxWidth.isFinite) {
          cacheWidth = (constraints.maxWidth * devicePixelRatio).toInt();
        } else {
          cacheWidth = 700; // Fallback to prevent OOM with infinite width
        }

        // We do NOT set memCacheHeight based on constraints to avoid aspect ratio distortion.
        // If the container is 100x100 but image is 16:9, setting both would squash it.
        // We only set memCacheHeight if the caller explicitly requested a specific height for the widget,
        // which implies they might know what they are doing, but even then, width is usually the primary
        // factor for resolution. The original code set it if height was provided.
        // Let's stick to setting it ONLY if height is provided explicitly, matching original behavior,
        // but using devicePixelRatio.

        int? cacheHeight;
        if (height != null && height!.isFinite) {
          cacheHeight = (height! * devicePixelRatio).toInt();
        }
        // If we set both, CachedNetworkImage (ResizeImage) will resize to those EXACT dimensions.
        // If width and height are provided, the widget forces that size, so the image should match.
        // If only width is provided/constrained, we let height be determined by aspect ratio.

        final image = CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          fadeInDuration: const Duration(milliseconds: 300),
          fadeOutDuration: const Duration(milliseconds: 100),
          memCacheWidth: cacheWidth,
          memCacheHeight: cacheHeight,
          maxWidthDiskCache: 800, // Limit disk cache size
          maxHeightDiskCache: 1200,
          placeholder: (context, url) => Container(
            color: Colors.grey[850],
            child: const Center(
              child: LoadingIndicator(size: 30),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            width: width,
            height: height,
            color: Colors.grey[800],
            child: const Icon(Icons.broken_image, color: Colors.white54),
          ),
        );

        if (borderRadius != null) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius!),
            child: image,
          );
        }

        return image;
      },
    );
  }
}
