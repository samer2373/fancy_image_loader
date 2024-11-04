import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_image_loader/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class FancyImageLoader extends StatelessWidget {
  final String path;
  final String ph;
  final Color? color;
  final BoxFit fit;
  final double? height;
  final double? width;
  final BlendMode? colorBlendMode;
  const FancyImageLoader(
      {super.key,
      required this.path,
      this.fit = BoxFit.cover,
      this.height,
      this.width,
      this.ph = ImageAssets.placeholder,
      this.colorBlendMode = BlendMode.srcIn,
      this.color});

  @override
  Widget build(BuildContext context) {
    if (path.isEmpty) {
      return Image.asset(
        ph,
        width: width,
        height: height,
        fit: fit,
      );
    }
    switch (getPathType()) {
      case PathType.network:
        return kIsWeb ? getNetowrkImage() : getCahedImage();
      case PathType.asset:
        return getAssetImage();
      case PathType.file:
        return getFileImage();
      case PathType.svg:
        return getSvgImage();
      case PathType.cache:
        return getFileImage();
    }
  }

  PathType getPathType() {
    if (path.startsWith('http')) {
      return PathType.network;
    } else if (path.contains('/cache')) {
      return PathType.cache;
    } else if (path.endsWith('svg')) {
      return PathType.svg;
    } else if (path.contains('image_picker') || path.contains('photospicker')) {
      return PathType.file;
    } else {
      return PathType.asset;
    }
  }

  Widget getCahedImage() {
    return CachedNetworkImage(
        maxHeightDiskCache: 300,
        height: height,
        width: width,
        fit: fit,
        color: color,
        // httpHeaders: Session.getSessionHeaders(),
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                child: SizedBox(
              height: 30,
              width: 30,
              child: AspectRatio(
                aspectRatio: 1,
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
            )),
        errorWidget: (context, url, error) => Image.asset(
              ph,
              height: height,
              width: width,
              fit: fit,
            ),
        imageUrl: path);
  }

  Widget getSvgImage() {
    return WebsafeSvg.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, colorBlendMode ?? BlendMode.srcIn),
    );
  }

  Widget getFileImage() {
    return Image.file(
      File(path),
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  Widget getAssetImage() {
    return Image.asset(
      path.isEmpty ? ph : path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  Widget getNetowrkImage() {
    return Image.network(path,
        height: height,
        width: width,
        fit: fit,
        color: color, errorBuilder: (context, url, error) {
      return Image.asset(
        ph,
        width: width,
        height: height,
        fit: fit,
      );
    });
  }

  double? progress(int? totalSize, int downloaded) {
    // ignore: avoid_returning_null
    if (totalSize == null || downloaded > totalSize) return null;
    return downloaded / totalSize;
  }
}

enum PathType { network, asset, file, svg, cache }
