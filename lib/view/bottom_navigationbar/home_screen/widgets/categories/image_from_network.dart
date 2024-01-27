import 'package:flutter/material.dart';
import 'package:the_cooker/resources/values_manager.dart';

class ImageFromNetwork extends StatelessWidget {
  const ImageFromNetwork({
    super.key,
    required this.imagePath,
    required this.width,
    required this.height,
    this.whiteColor, this.fit,
  });

  final String imagePath;
  final double width;
  final double height;
  final bool? whiteColor;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imagePath,
      width: width,
      height: height,
      fit: fit,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(PaddingManager.p20),
            child: CircularProgressIndicator(
              color: whiteColor == true
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
    );
  }
}
