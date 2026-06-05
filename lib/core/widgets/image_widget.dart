import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_project/core/theming/colors.dart';

class AppCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  const AppCachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      placeholder: (context, url) => Center(
        child: CircularProgressIndicator(
          color: ColorsManager.mainBlue,
        ),
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/doctor_1.png',
        fit: fit,
      ),
    );
  }
}
