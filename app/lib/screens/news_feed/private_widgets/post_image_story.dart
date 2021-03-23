import 'package:app/config/color_palette.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class PostImageStory extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const PostImageStory({
    Key key,
    @required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ExtendedImage.network(
          imageUrl,
          shape: BoxShape.rectangle,
          height: 180,
          width: 160,
          fit: BoxFit.fill,
          cache: true,
          border: hasBorder
              ? Border.all(color: ColorPalette.postText, width: 2.0)
              : null,
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
