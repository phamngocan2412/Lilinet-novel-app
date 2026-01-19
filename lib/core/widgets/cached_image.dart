import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'loading_indicator.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double? borderRadius;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    // Show error widget immediately if URL is invalid
    if (imageUrl.isEmpty ||
        imageUrl == 'null' ||
        imageUrl == 'undefined' ||
        imageUrl.contains('originalnull') ||
        imageUrl.contains('originalundefined')) {
      return _buildErrorWidget(context, 'Invalid URL');
    }

    final image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      // Add Referer header to bypass some hotlink protections
      httpHeaders: const {
        'Referer': 'https://google.com',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      },
      fadeInDuration: const Duration(milliseconds: 300),
      fadeOutDuration: const Duration(milliseconds: 100),
      memCacheWidth: (width != null && width!.isFinite)
          ? (width! * 2).toInt()
          : 700,
      memCacheHeight: (height != null && height!.isFinite)
          ? (height! * 2).toInt()
          : null,
      maxWidthDiskCache: 800,
      maxHeightDiskCache: 1200,
      placeholder: (context, url) => Container(
        color: Colors.grey[850],
        child: const Center(child: LoadingIndicator(size: 30)),
      ),
      errorWidget:
          errorWidget ??
          (context, url, error) => _buildErrorWidget(context, error),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: image,
      );
    }

    return image;
  }

  Widget _buildErrorWidget(BuildContext context, dynamic error) {
    if (errorWidget != null) {
      return errorWidget!(context, imageUrl, error);
    }

    // Default error widget
    final widget = Container(
      width: width,
      height: height,
      color: Colors.grey[850],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_rounded,
            color: Colors.white24,
            size: 30,
          ),
        ],
      ),
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius!),
        child: widget,
      );
    }
    return widget;
  }
}
