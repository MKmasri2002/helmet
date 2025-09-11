import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeImage extends StatelessWidget {
  final String imageUrl;
  const HomeImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        height: 80,
        width: 80,
        imageBuilder: (context, imageProvider) => Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.image,
          size: 75,
          color: Colors.grey,
        ),
      ),
    );
  }
}
